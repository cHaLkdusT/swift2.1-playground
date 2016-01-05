//: Previous [Numeric Literals](@previous)
//: # Numeric Type Conversion
/*: 
Use the `Int` type for all general-purpose integer constants and variables in your code, even if they are known to be non-negative. Using the default integer type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.

Use other integer types only when they are specifically needed for the task at hand, because of explicitly-size data from an external source, or for performance, memory usage, or ther necessary optimization.
*/
//: ## Integer Conersion
//: The range of numbers that can be stored in an integer constant or variable is different for each numeric type.

//: To convert one specific number type to another, you initialize a new number of the desired type with the existing value. `UInt16` and `UInt8` cannot be added together directly, because they are not of the same type.

//: ## Integer and Floating-Point Conversion
//: Conversions between integer and floating-point numberic types must be made explicit

//: Floating-point to integer conversion must also be made explicity. An integer type can be initialized with a `Double` or `Float` value

/*: 
Floating-point values are always truncated whenused to initialized a new integer value in this way. `4.75` becomes `4` and `-3.9` becomes `-3`

Move on to [Type Aliases](@next)
*/
