//: Previous [Optional Protocol Requirements](@previous)
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
protocol TextRepresentable {
    var textualDescription: String { get }
}
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
//: ## Protocol Extensions
/*:
 Protocols can be extended to provide method and property implementations to conforming types. This allows you to define behavior on protocols themselves, rather that in each type's individual conformance or in a global function.
 
 For example, the `RandomNumberGenerator` protocol can be extended to provide a `randomBool()` method, which uses the results of the required `random()` method to return a random `Bool` value:
 */
extension RandomNumberGenerator {
    func randomBool() -> Bool {
        return random() > 0.5
    }
}
//: By creating an extension on the protocol, all conforming types automatically gain this metho implementation without any additional modification.
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And here's a random Boolean: \(generator.randomBool())")
//: ### Providing Default Implementations
/*:
 You can use protocol extensions to provide a default implementation to any method or property requirement of that protocol. If a conforming type provides its own implementation of a required method or property, that implementation will be used instead of the one provided by the extension.
 
 NOTE: Protocol requirements with default implementations provided by extensions are distinct from optional protocol requirements. Although conforming types don't ahve to provide their own implementation of either, requirements with default implementations can be called without optional chaining.
 
 For example, the `PrettyTextRepresentatble` protocol, which inherits the `TextRepresentable` protocol can provide a default implementation of its requirement `prettyTextualDescription` property to simply return the result of accessing the `textualDescription` property:
 */
extension PrettyTextRepresentable {
    func asPrettyText() -> String {
        return prettyTextualDescription
    }
}
//: ### Adding Constraints to Protocol Extensions
/*:
 When you define a protocol extension, you can specify constraints that conforming types must satisfy before the methods and properties of the extension are available. You write theses constraints after the name of the protocol you're extending using a `where` clause, as described in `Where Clauses`.
 
 For instance, you can define an extension to the `CollectionType` protocol that applies to any collection whose elements conform to the `TextRepresentable` protocol from the example above.
 */
extension CollectionType where Generator.Element : TextRepresentable {
    func asList() -> String {
        let itemsAsText = self.map{ $0.textualDescription }
        return "[" + itemsAsText.joinWithSeparator(", ") + "]"
    }
}
/*:
 The `textualDescription` property returns the textual descripton of the entire collection by concatenating the textual representation of each element in the collection into a comma-separated list, enclosed in brackets.
 
 Consider the `Hamster` structure from before, which conforms to the `TextRepresentable` protocol, and an array of `Hamster` values:
 */
let murrayTheHamster = Hamster(name: "Murray")
let morganTheHamster = Hamster(name: "Morgan")
let mauriceTheHamster = Hamster(name: "Maurice")
let hamsters = [murrayTheHamster, morganTheHamster, mauriceTheHamster]
//: Because `Array` conforms to `CollectionType` and the array's elements conform to the `TextRepresentable` protocol, the array can use the `textDescription` property to get a textual representation of its contents:
print(hamsters.asList())
//: NOTE: If a conforming type satisfies the requirement for multiple constrained extensions that provide implementations for the same method or property, Swift will use the implementation corresponding to the most specialized constraints.




//: [Next](@next)
