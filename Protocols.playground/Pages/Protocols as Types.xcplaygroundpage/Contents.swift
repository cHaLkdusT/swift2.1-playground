//: Previous [Initializer Requirements](@previous)
//: ## Protocols as Types
/*:
 Protocols do not actually implement any functionality themeselves. Nonetheless, any protocol you create will become a fully-fledge type for use in your code.
 
 Because it is a type, you can use a protocol in many places where other types are allowed, including:
 * As a parameter type or return type in a function, method, or initilaizer
 * As the type of a constant, variable or property
 * As the type of items in an array, dictionary or other container
 
 NOTE: Because protocols are types, begin their names with a capital letter (such as `FullyNamed` and `RandomNumberGenerator` to match the names of other types in Swift (such as `Int`, `String` and `Double`)
 
 Here's an example of a protocol used as a type
 */
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
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}
/*:
 This example defines a new class called `Dice`, which represents an _n_-sided dice for use in a board game. `Dice` instances have an integer property caled `sides`, which represents how many sides they have, and a property called `generator`, which provides a random number generator from which to create dice roll values.
 
 The `generator` property is of type `RandomNumberGenerator`. Therefore, you can set it to an instance of _any_ type that adopts the `RandomNumberGenerator` protocol. Nothing else is required of the instance you assign to this property, except that the instance must adopt the `RandomNumberGenerator` protocol.
 
 `Dice` also has an initializer, to set up its initial stae. This initializer has a parameter called `generator`, which is also of type `RandomNumberGenerator`. You can pass a value of any conforming type in to this parameter when initializer a new `Dice` instance.
 
 `Dice` provides one instance method, `roll`, which returns an integer value between 1, and the number of sides on the dice. This method calls the generator's `random()` methdo to create a new random method between `0.0` and `1.0` and uses this random number to create a dice roll value within the correct range. Because `generator` is known to adop `RandomNumberGenerator`, it is guaranteed to have a `random()` method to call.
 
 Here's how the `Dice` class can be used to create a six-sided dice with a `LinearCongruentialGenerator` instance as its random number generator:
 */
var d6 = Dice(sides: 6, generator: LinearCongruentialGenerator())
for _ in 1...5 {
    print("Random dice roll is \(d6.roll())")
}
//: Move on to [Delegation](@next)
