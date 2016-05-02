//: Previous [Protocols](@previous)
//: ## Method Requirements
/*:
 Protocols can require specific instance methods and type methods. These methdos are written as part of the protocol's definition in exactly the same way as for normal instance and type methods, but without curly braces or method body. Variadic parameters are allowed, subject to the same rules as for normal methods. Default values, however, cannot be specified for method parameters within a protocol's definition.
 
 As with type property requiremetns, you always prefix type method requirements with the `static` keyword when they are defined in a protocol. This is true even though type methods requirements are prefixed with the `class` or `static` keyword when implemented by a class
 */
protocol SomeProtocol {
    static func someTypeMethod()
}
//: The following example defines a protocol with a single isntance method requirement:
protocol RandomNumberGenerator {
    func random() -> Double
}
/*:
 This protocol, `RandomNumberGenerator`, requires any conforming type to have an instance method called `random`, which returns a `Double` value whenever it is called. Although it is not specified as part of the protocol, it is assumed that this value will be a number from `0.0` up to (but not including) `1.0`.
 
 The `RandomNumberGenerator` protocol does not make any assumptions about how each random number will be generated-it simply requires the generator to provide a standard way to generate a new random number.
 
 Here's an implementaiton of a class that adopts and conforms to the `RandomNumberGenerator` protocol. This class implements a pseudorandom number generator algorithm known as _linear congruential generator_:
 */
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
let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")
//: Move on to [Mutating Method Requirements](@next)
