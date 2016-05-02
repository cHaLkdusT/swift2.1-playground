//: Previous [Mutating Method Requirements](@previous)
//: ## Initializer Requirements
//: Protocols can require specific initializers to be implemented by conforming types. You write these initializers as part of the protocol's definition in exactly the same way as for normal initializers, but without curly braces or an initializer body:
protocol SomeProtocol {
    init(someParameter: Int)
}
/*:
 ### Class Implementations of Protocol Initializer Requirements
 You can implement a protocol initializer requirement on a conforming class as either a designated initializer or convenience initializer. In both cases, you must mark the initializer implementation with the `required` modifier:
 */
class SomeClass: SomeProtocol {
    required init(someParameter: Int) {
        // Initializer implementation goes here
    }
}
/*:
 The use of the `required` modifier ensures that you provide an explicit or inherited implementation of the initializer requirement on all subclasses of the conforming class, such that they also conform to the protocol.
 
 For more infomation on required initializer, see Required Initializers.
 
 NOTE: You do not need to mark protocol initializer implementations with the `required` modifier on classes that are marked with the `final` modifier, because final classes cannot be subclassed. For more on the `final` modifier, see Preventing Overrides.
 
 If a subclass overrides a designated initializer from a superclass, and also implements a matching initializer requirement from a protocol, mark the initializer implementation with both the `required` and `override` modifiers:
 */
protocol SomeProtocol1 {
    init()
}
class SomeSuperClass1 {
    init() {
        // initializer implementation goes here
    }
}
class SomeSubClass1: SomeSuperClass1, SomeProtocol1 {
    // "required" from SomeProtocol conformance; "override" from SomeSuperClass
    required override init() {
        // initializer implementation goes here
    }
}
//: ### Failable Initializer Requirements
/*:
 Protocols can define failable initializers requirements for conforming types, as defined in Failable Initializers.
 
 A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type. A nonfailable initializer requirement can be satisfied by a nonfailable initializer or an implicitly unwrapped failable intializer.
 
 Move on to [Protocols as Types](@next)
 */