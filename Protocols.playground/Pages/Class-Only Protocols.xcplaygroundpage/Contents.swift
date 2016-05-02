//: Previous [Protocol Inheritance](@previous)
/// Class-Only Protocols
/*:
 You can limit protocol adoption to class typs (and not structures or enumerations) by adding the `class` keyword to a protocol's inheritance list. The `class` keyword must always appear first in a protocol's inheritance list, before any inherited protocols:
 */
protocol SomeInheritedProtocol { }
protocol SomeClassOnlyProtocol: class, SomeInheritedProtocol {
    // class-only protocol definition goes here
}
/*:
 In the example above, `SomeClassOnlyProtocl` can only be adopted by class types. It is a compile-time error to write a structure or enumeration definition that tries to adopt `SomeClassOnlyProtocol`.
 
 NOTE: Use a class-only when the behavior defined by that protocol's requirements assumes or requires that a conforming type has reference semantics rather than value semantics.
 */
//: Move on to [Protocol Composition](@next)
