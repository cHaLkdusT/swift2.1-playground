//: # Classes and Structures
/*:
_Classes_ and _structures_ are general-purpose, flexible constructs that become the building blocks of your program's code. You define properties and methods to add functionality to your classes and structures by using exactly the same syntax as for constants, variables, and functions.
Unlike other programming launguages, Swift does not require you to create a separate interface and implementtion files for custom classes and structures. In Swift, you define a class or a structure in a single file, and the external interface to that class or structure is automatically made available for other codes to use.
An instance of a _class_ is traditionally known as an _object_. However, Swift classes and structures are much closer in functionality than in other languages, and much of this chapter describes functionality that can apply to instances of _either_ class or structure type. Becuase of this, the more general term _instance_ is used.
*/
//: ## Comparing Classes and Structures
/*:
Classes and structures in Swift have many things in common. Both can
* Define properties to store values
* Define methods to provide functionality
* Define subscripts to provide access to their values using subscript syntax
* Define initializers to set up their initial state
* Be extended to expand their functionality beyond a default implementation
* Conform to protocols to provide standard functionality of a certain kind

Classes have addition capability that structures do not:
* Inheritance enables one class to inherit the characteristics of another
* Type casting enables you to check and interpret the type of a class instance at runtime
* Deiniatilizers enable an instance of a class to free up any resources it has assigned
* Reference counting allows more than one reference to a class inheritance.

Structures are always copies when they are passed around in your code and do not use reference counting
*/
//: ## Definition Syntax
//: Classes and structures have a similar definition syntax. You introduce classes with the `class` keyword and structures witht the `struct` keyword. Both place their entire definition within a pair of braces:
class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}
//: When you define a new class or structure, you effectively define a brand Swift type. Give types `UpperCamelCase` names to match the capitalization of standard Swift types. Conversely, always give properties and methods `lowerCamelCase` names to differentiate them from type names.
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interalced = false
    var frameRate = 0.0
    var name: String?
}
//: ## Class and Structure Instances
// The `Resolution structure definition and the `VideoMode` class definition only describe what a `Resoulition` or `VideoMode` will look like. They themselves do not descrie a specific resolution or vide mode. You need to create an instance of the structure or class
let someResolution = Resolution()
let someVideoMode = VideoMode()
//: ## Accessing Properties
//: You can access the properties of an instance using _dot syntax_. In dot syntax, you write the property name immediately after the instance name, separated by a period (`.`) without any spaces:
print("The width of someResolution is \(someResolution.width)")
//: You can drill down into sub-properties, such as the `width` property in the `resolution` property of `VideoMode`
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
//: You can also use dot syntax to assign a new value to a variable property
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")
//: ## Memberwise Initializers for Structures Types
//: All structures have an automatically-generated _memberwise initializer_, which you can use to initialize the member properties of new structure instances. Initial values for the properties of the new instances can be passed to the memberwise initializer by name
let vga = Resolution(width: 640, height: 480)
//: Unlike structures, class instances do not receive a default memberwise initializer.
//: Move on to [Structures and Enumerations Are Value Types](@next)
