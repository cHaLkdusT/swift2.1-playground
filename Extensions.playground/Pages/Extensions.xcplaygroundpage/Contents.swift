//: # Extensions
/*:
 _Extensions_ add new functionality to an existing class, structure, enumeration or protocol type. This includes the ability to extend types for which you do not have access to the original source code (known as _retroactive modeling_). Extensions are similar to categories in Objective-C. (Unlike Objective-C categories. Swift extensions do not have names.)
 
 Extensions in Swift ca:
 * Add computed instance properties and computed type properties
 * Define instance methods and type methods
 * Provide new initializers
 * Define subscripts
 * Define and use new nested types
 * Make an existing type conform to a protocol
 
 In Swift, you can even extend a protocol to provide implementations of its requirements or add additional functionality that conforming types can take advantage of. For more details, see Protocol Extensions.
 
 NOTE: Extensions can add new functionality to a type, but they cannot override existing functionality.
 
 ## Extension Syntax
 Declare extensions with the `extension` keyword:
 */
//extension SomeType {
//    // new functionality to add to SomeType goes here
//}
//: An extension can extend an existing type to make it adopt one or more protocols. Where this is the case, the protocol names are written in exactly the same way as the for a class or structure:
//extension SomeType: SomeProtocol, AnotherProtocol {
//    // implementation of protocol requirements goes here
//}
/*:
 Adding protocol conformance in this way is described in Adding Protocol Conformance with an Extension.
 
 NOTE: If you define an extension to add new functionality to an existing type, the new functionality will be available on all existing instances of that type, even if they were created before the extension was defined.
 */

//: Move on to [Computed Properties](@next)
