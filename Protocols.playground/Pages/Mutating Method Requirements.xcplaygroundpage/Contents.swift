//: Previous [Method Requirements](@previous)
//: ## Mutating Method Requirements
/*:
 It is sometimes necessary for a method to modify (or _mutate_) the instance it belongs to. For instance methods on value types (that is, structures and enumerations) you place the `mutating` keyword before a method's `func` keyword to indicate that the method is allowed to modify the instance it belongs to and any properties of that instance. This process is described in Modifying Value Types from Within Instance Methods
 
 If you define a protocol instance method requirement that is intended to mutate instances of any type that adopts the protocol, mark the method with the `mutating` keyword as part of the protocol's definition. This enables structures and enumerations to adopt the protocol and satisfy that method requirement.
 
 NOTE: If you mark a protocol instance method requirements as `mutating`, you do not need to write the `mutating` keyword when writing an implementation of that method for a class. The `mutating` keyword is only used by structures and enumerations.
 
 The example below defines a protocol called `Togglable`, which defines a single instance method requirement called `toggle`. As its name suggests, the `toggle()` method is intended to toggle or invert the state of any conforming type, typically by modifying a property of that type.
 
 The `toggle`() method is marked with the `mutating` keyword as part of the `Togglable` protocol definition, to indicate that method is expected to mutate the state of a conforming instance when it is called:
 */
protocol Togglable {
    mutating func toggle()
}
/*:
 If you implement the `Togglable` protocol for a structure or enumeration, that structure or enumeration can conform to the protocol by providing an implementation of the `toggle()` method that is also marked as `mutating`.
 
 The example below defines an enumeration called `OnOffSwitch`. This enumeration toggles betwo two states, indicated by the enumeration cases `On` and `Off`. The enumeration's `toggle` implementation is marked as `mutating`, to match the `Togglable` protocol's requirements:
 */
enum OnOffSwitch: Togglable {
    case Off, On
    mutating func toggle() {
        switch self {
        case Off:
            self = On
        case On:
            self = Off
        }
    }
}
var lightSwitch = OnOffSwitch.Off
lightSwitch.toggle()
//: Move on to [Initializer Requirements](@next)
