//: # Protocols
/*:
 A _protocol_ defines a blueprint of methods, properties and other requirements that suit a particular task or piece of functionality. The protocol can then be _adopted_ by a class, structure or enumeration to provide an actual implementation of those requirements. Any type that satisfies the requirements of a protocol is said to _conform_ to that protocol.
 
 In addition to specifying requirements that conforming types must implement, you can extend a protocol to implement some of these requirements or to implement additional functionality that conformorning types can take advantage of.
 
 ## Protocol Syntax
 You define protocols in a very similar way to classes, structures and enumerations:
 */
//protocol SomeProtocol {
//    // protocol definition here
//}
//: Custom types state that they adopt a particular protocol by placing the protocol's name after the type's name, separated by a colon, as part of their definition. Multiple protocols can be listed and are separated by commas
//struct SomeStructure: FirstProtocol, AnotherProtocol {
//    // structure definition here
//}
//: If a class has superclass, list the superclass name before any protocols it adopts, followed by comma:
//class SomeClass: SomeSuperClass, FirstProtocol, AnotherProtocol {
//    // class definition here
//}
//: ## Property Requirements
/*:
 A protocol can require any conforming type to provide an instance property or type property with a particular name and type. The protocol doesn't specify whether the property should be a stored property or a computed property-it only specifies the required property name and type. The protocl also specifies whether each property must be gettable or gettable _and_ settable.
 
 If a protocol requires a property to be gettable and settable, that property requirement cannot be fulfiled by a constant stored property or read-only computed property. If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it is valid for the property to be also settable if this is useful for your own code.
 
 Property requirements are always declared as variable properties, prefixed with the `var` keywrod. Gettable and settable properties are indiciated by writing `{ get set }` after their type declaration, and gettable properties are indicated by writing `{ get }`.
 */
protocol SomeProtocol {
    var mustBeSettable: Int { get set }
    var doesNotNeedToBeSettable: Int { get }
}
//: Always prefix type property requirements with the `static` keyword when you define them in a protocol. This rule pertains even though type property requirements can be prefixed with the `class` or `static` keyword when implemented by a class:
protocol AnotherProtocol {
    static var sometypeProperty: Int { get set }
}
//: Here's an example of a protocol with a single instance property requirement:
protocol FullyNamed {
    var fullName: String { get }
}
/*:
 The `FullyNamed` protocol requires a conforming type to provide a fully-qualified name. The protocol doesn't specify anything else about the nature of the conforming type-it only specifies that the type must be able to provide a full name for itself. The protocol states that any `FullyNamed` type must have a gettable instance property called `fullName`, which is of a type `String`.
 
 Here's an example fo a simple structure that adopts and conforms to the `FullyNamed` protocol:
 */
struct Person: FullyNamed {
    var fullName: String
}
let john = Person(fullName: "Jone Appleseed")
/*:
 This example defines a structure called `Person`, which represents a specific named person. It states that it adopts the `FullyNamed` protocol as part of the first line of its definition.
 
 Each instance of `Person` has a single stored property called `fullName`, which is of type `String`. This matches the single requiremetn of the `FullyNamed` protocol. (Swift reports an error at compile-time if a protocol requirement is not fulfilled.)
 
 Here's a more complex class, which also adopts and conforms to the `FullyNamed` protocol:
 */
class Starship: FullyNamed {
    var prefix: String?
    var name: String
    init(name: String, prefix: String? = nil) {
        self.name = name
        self.prefix = prefix
    }
    var fullName: String {
        return (prefix != nil ? prefix! + " " : "") + name
    }
}
var ncc1701 = Starship(name: "Enterprise", prefix: "USS")
ncc1701.fullName
//: This class implements the `fullName` property requirement as a computed read-only property for a starship. Each `Starship` class instance stores a mandatory `name` and an optional `prefix`. The `fullName` property uses the `prefix` value if it exists, and prepends it to the beginning of `name` to create a full name for the starship.

//: Move on to [Method Requirements](@next)