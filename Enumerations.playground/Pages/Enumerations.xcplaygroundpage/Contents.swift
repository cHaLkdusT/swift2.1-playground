//: # Enumerations
/*:
 An _enumeration_ defines a common type for a group of related values and enables you to work with thouse values in a type-safe way within your code
 
 If you are familiar with C, you will know that C enumerations assign related names to a set of integer values. Enumerations in Swift are much more flexible, and do not have to provide a value for each case of the enumeration. If a value (known as a "raw" value) _is_ provided for each enumeration case, the value can be a string, a chracter, or a value of any integer or floating-point type.
 
 Alternatively, enumeration cases can specify associated values of _any_ type to be stored along with each different case value, much as union or variants do in other languages.
 
 Enumerations in Swift are first-class types in their own right. They adopt many features traditionally supported only by classes, such as computed properties to provide additional information about the enumeration's current value, and instance methods to provide functionality related to the values the enumeration represents. Enumerations can also define initializers to provide an initial case value; can be extended to expand their functionality beyond their original implementation; and can conform to protocols to provide standard functionality.
*/
//: ## Enumerations Syntax
//: You introduce enumerations with the `enum` keyword and provide their entire definition within pair of braces.
enum SomeEnumeration {

}
//: Example for the four main points of compass
enum CompassPoint {
    case north
    case south
    case east
    case west
}

/*: 

 The values defined in an enumeration are its _enumeration cases_. You use the `case` keyword to introduce new enumeration cases.
 
 > Unlike C and Objective-C, Swift enumerations cases are not assigned a default integer value when they are created. In the `CompassPoint` example above, `north`, `south`, `east` and `west` do not implicitly equal `0`, `1`, `2`, and `3`. Instaad, the diferent enumerations cases are fully-fledged values in their own right, with an explicitly-defined type of `CompassPoint`
 
 Multiple cases can appear on a single line, separated by commas:
*/
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//: Each enumeration definition defines a brand new type. Like other types in Swift, their names (such as `CompassPoint` and `Planet`) should start with a capital letter. Give the enumeration types singular rather that plural names, so that they read as self-evident:
var directionToHead = CompassPoint.west
//: The type of `directionToHead` is inferred when it is initialized with one of the possible values of `CompassPoint`, you can set it to a differnt `CompassPoint` value using the shorter dot syntax:
directionToHead = .east
//: Move on to [Matching Enumeration Values with a Switch Statement](@next)
