//: Previous [Class-Only Protocols](@previous)
//: ## Protocol Composition
/*:
 It can be useful to require a type to conform to multiple protocols at once. You can combine multiple protocols into a single requirement with a _protocol composition_. Protocol compositions have the form `protocol<SomeProtocol, AnotherProtocol>`. You can list as many protocols within the pair of angle brackets (`<>`) as you need, separated by commas.
 
 Here's an example that combines two protocols called `Named` and `Aged` into a single protocol composition requirement on a function parameter:
 */
protocol Named {
    var name: String { get }
}
protocol Aged {
    var age: Int { get }
}
struct Person: Named, Aged {
    var name: String
    var age: Int
}
func wishHappyBirthday(celebrator: protocol<Named, Aged>) {
    print("Happy birthday \(celebrator.name) - you're \(celebrator.age)")
}
let birthdayPerson = Person(name: "Malcom", age: 21)
wishHappyBirthday(birthdayPerson)
/*:
 This example defines a protocol called `Named`, with a single requirement for a gettable `String` property called `name`. It also defines a protocol called `Aged`, with a single requirement for a gettable `Int` property called `age`. Both of these protocols are adopted by a structure called `Person`.
 
 The example also defines a function called `wishHappyBirthday`, which takes a single parameter called `celebrator`. The type of this parameter is `protocol<Named, Aged>`, which means "any type that conforms to both the `Named` and `Aged` protocols". It doesn't matter what specific type is passed to the function, as long as it conforms to both of the required protocols.
 
 The example then creates a new `Person` instance called `birthdayPerson` and passes this new instance to the `wishHappyBirthday(_:)` function. Because `Person` conforms to both protocols, this is a valide call, and the `wishHappyBirthday(_:)` function is able to print its birthday greeting.
 
 NOTE: Protocol compositions do not define a new, permanent protocol type. Rather, they define a temporary local protocol that has the combined requiremetns of all protocols in the composition.
 */
//: Move on to [Checking for Protocol Conformance](@next)
