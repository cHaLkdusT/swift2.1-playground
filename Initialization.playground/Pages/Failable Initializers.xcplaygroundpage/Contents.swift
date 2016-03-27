//: Previous [Initializer Inheritance and Overriding](@previous)
//: ## Failable Initializers
/*:
It is sometimes useful to define a class, structure or enumeration for which initialization can fail. This failure might be triggered by invalid initialization parameter values, the absence of a requried external resource, or some other condition that prevents initilization from succeeding.

To cop with initialization conditions that can fail, define one or more _failable initializers_ as part of a class, structure or enumeration definition. You write a failable initializer by placing a question mark after the `init` keyword (`init?`).

You cannot define a failable and a nonfailable initializer with the same parameter types and names.

A failable initializer creates an _optional_ value of the type it initializes. You write `return nil` within a failable initializer to indicate a point at which initializtion failure can be triggered.

Strictly speaking, initializers do not return a value. Rather, their roles is to ensure that `self` is fully and correctly initialized by the time that initialization ends. Although you write `return nil` to trigger an initialization failure, you do not use the `return` keyword to inidicate initialization success.
*/
// If an empty string is found, an intialization failure is triggered
struct Animal {
    let species: String
    init?(species: String) {
        if species.isEmpty {
            return nil
        }
        self.species = species
    }
}
//: You can use this failable initializer to try initialize a new `Animal` instance to check if iniitialization succeeded.
let someCreature = Animal(species: "Giraffe")
if let giraffe = someCreature {
    print("An animal was initialized with a species of \(giraffe.species)")
}
//: If you pass an empty string value to the failable initializer's `species` parameter, the initializer triggers an initialization failure
let anonymouseCreature = Animal(species: "")
if anonymouseCreature == nil {
    print("The anonymous creature could not be initialized")
}
//: Checking for an empty string value (such as "" ather than "Giraffe") is not the same as checking for `nil` to indicate the absence of an _optional_ `String` value. In the example above, an empty String (`""`) is a valie, nonoptional `String`. However, it is not appropriate for an animal to have an empty string as value of its `species` property. To model this restriction, the failable inializer triggers an initialization failure if an empty string is found.
//: ## Failable Initializers for Enumerations
//: You can use a failable initializer to selec appropriate enumeration case based on one or more parameters. The initializer can then fail if the provided parameters do not match an appropriate enumeration case.
// A failable initializer is used to find an appropriate enumeration case for a `Character` value representing a temperature symbol
enum TemperatureUnit {
    case Kelvin, Celsius, Fahrenheit
    
    init?(symbol: Character) {
        switch symbol {
        case "K":
            self = .Kelvin
        case "C":
            self = .Celsius
        case "F":
            self = .Fahrenheit
        default:
            return nil
        }
    }
}
//: You can use this failable initializer to choose an appropriate enumeration case for three possible states and to cause initialization to fail if the parameter does not match one of theses states
let fahrenheitUnit = TemperatureUnit(symbol: "F")
if fahrenheitUnit != nil {
    print("This is a defined temperature unit, so initializaiton succeeded.")
}
let unknownUnit = TemperatureUnit(symbol: "X")
if unknownUnit == nil {
    print("This is not a defined temperature unit, so initialization failed.")
}
//: ## Failable Initializers for Enumerations with Raw Values
//: Enumerations with raw values automatically recieve a failable initializer, `init?(rawValue:)`, that takes a parameter called `rawValue` of the appropriate raw-value type and selects a matching enumeration case if one is found, or triggers an initialization failure
enum TemperatureUnit2: Character {
    case Kelvin = "K", Celsius = "C", Fahrenheit = "F"
}
let fahrenheitUnit2 = TemperatureUnit2(rawValue: "F")
if fahrenheitUnit2 != nil {
    print("This is a defined temperature unit, so initialiazation succeeded")
}
let unknownUnit2 = TemperatureUnit2(rawValue: "X")
if unknownUnit2 == nil {
    print("This is a not defined temperature unit, so initialization failed.")
}
//: ## Propagation of Initialization Failure
/*:
A failable initializer of a class, structure, or enumeration can delegate across to another failable initializer from the same class, structure or enumeration. Similarly, a subclass failable initializer can delegate up to a superclass failable initializer.

In either case, if you delegate to another initializer that causes initialization to fail, the entire initialization process fails immediately, and no futher initialization code is executed.

A failable initializer can also delegate to a nonfailable initilaizer. Use this approach if you need to add a potential failure state to an existing initialization process that does not otherwise fail.
*/
// `CartItem` models an item in an online shopping cart
class Product {
    let name: String
    init?(name: String) {
        self.name = name
        if name.isEmpty { return nil }
    }
}
class CartItem: Product {
    let quantity: Int
    init?(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
        if quantity < 1 { return nil }
    }
}
//: The failable initializer for `CartItem` starts by validating that it has received a `quantity` value of `1` or more. If the     `quantity` is invalid, the entire initialization process fails immediately and no further initialization code is executed. Likewise, the failable initializer for `Product` checks the `name` value, and initilaizer process fails immediately if `name` is the empty string.

//: If you create a `CartItem` instance with a nonempty name and a quantity of `1` or more, intiliazation succeeds
if let twoSocks = CartItem(name: "sock", quantity: 2) {
    print("Item: \(twoSocks.name), quantity: \(twoSocks.quantity)")
}
//: If you try to create `CartItem` instance with a quantity of `0` the `CartItem` initializer causes initialization to fail
if let zeroShirts = CartItem(name: "shirt", quantity: 0) {
    print("Item: \(zeroShirts.name), quantity: \(zeroShirts.quantity)")
} else {
    print("Unable to initialized zero shirts")
}
//: Similary, if you try to create a `CartItem` instance with an empy `name` value, the superclass `Product` initializer causes initialization to fail.
if let oneUnnamed = CartItem(name: "", quantity: 1) {
    print("Item: \(oneUnnamed.name), quantity: \(oneUnnamed.quantity)")
} else {
    print("Unable to initialized one unnamed product")
}
//: ## Overriding a Failable Initializer
/*:
You can override a superclass failable initializer in a subclass, just like any other initializer. Alternatively, you can override a superclass failable initializer with a subclass _nonfailable_ initializer. This enables you to define a subclass for which initialization of the superclass is allowed to fail. 

Note that if you override a failable superclass initializer with a nonfailable subclass intializer, the only way to delegate up to the superclass is to force-unwrap the result of the failable superclass initilaizer.
*/
//: This class models a document that can be initialized with a `name` property that is either a nonempty string value or `nil`, but cannot be an empty string
class Document {
    var name: String?
    init() {}
    init?(name: String) {
        self.name = name
        if name.isEmpty {
            return nil
        }
    }
}
//: The `AutomaticallyNamedDocument` subclass overrides both the designated initializers introduced by `Document`. These overrides ensure that an `AutomaticallNamedDocument` instance has an initial `name` value of `"[Untitled]"` if the instance is initialized without a name, or if an empty string is passed to the `init(name:)` initializer
class AutomaticallyNamedDocument: Document {
    override init() {
        super.init()
        self.name = "[Untitled]"
    }
    override init(name: String) {
        super.init()
        if name.isEmpty {
            self.name = "[Untitled]"
        } else {
            self.name = name
        }
    }
}
/*:
The `AutomaticallyNamedDocument` overrides its superclass's failable `init?(name:)` initializer with a nonfailable `init(name:)` initializer. Because `AutomaticallyNamedDocument` copes with the empty string case in a different way that its superclass, its initializer does not need to fail, and so it provides a nonfailable version of the initializer instead.

You can use forced unwrapping in an initializer to call a failable initializer from the superclass as part of the implementation of a subclass's nonfailable initializer.
*/
class UntitledDocument: Document {
    override init() {
        super.init(name: "[Untitled]")!
    }
}
//: In this case, if the `init(name:)` initializer of the superclass were called with an empty string as the name, the force unwrapping operation would result in a runtime error. However, because it's called with a string constant, you can see that the initializer won't fail, so in runtime error can occur in this case.

//: ## The init! Failable Initializer
/*
You typically define a failable initializer that creates an optional instance of the appropriate type by placing a question mark after the `init` keyword. Alternatively, you can define a failable initializer that creates an implicitly unwrapped optional mark after the `init` keyword (`init!`) instead of a question mark.

You can delegate from `init?` to `init!` and vice versa, and you can override `init?` with `init` and vice versa. You can also delegate from `init` to `init!` although doing so will triger an assertion if the `init!` initializer cause initialization to fail.
*/
//: Move on to [Required Initializer](@next)
