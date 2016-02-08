//: Previous [Numeric Literals](@previous)
//: # Numeric Type Conversion
/*:
Use the `Int` type for all general-purpose integer constants and variables in your code, even if they are known to be non-negative. Using the default integer type in everyday situations means that integer constants and variables are immediately interoperable in your code and will match the inferred type for integer literal values.

Use other integer types only when they are specifically needed for the task at hand, because of explicitly-size data from an external source, or for performance, memory usage, or ther necessary optimization.
*/
//: ## Integer Conersion
//: The range of numbers that can be stored in an integer constant or variable is different for each numeric type.
// let cannotBeNegative: UInt8 = -1
// let tooBig: Int8 = Int8.max + 1
//: To convert one specific number type to another, you initialize a new number of the desired type with the existing value. `UInt16` and `UInt8` cannot be added together directly, because they are not of the same type.
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)
//: ## Integer and Floating-Point Conversion
//: Conversions between integer and floating-point numberic types must be made explicit
let three = 3
let pointOneFourOneFiveNine = 0.14159
let pi = Double(three) + pointOneFourOneFiveNine
//: Floating-point to integer conversion must also be made explicity. An integer type can be initialized with a `Double` or `Float` value
let integerPi = Int(pi)
/*: 
Floating-point values are always truncated whenused to initialized a new integer value in this way. `4.75` becomes `4` and `-3.9` becomes `-3`

The rules for combining numeric constants and variables are different from the rules for numeric literals. The literal value 3 can be added directly to a literal value of 0.1419, because number literals do not have an explicit type in and of themselves. Their type is inferred only at the point that they are evaluated by the compiler.

Move on to [Type Aliases](@next)
*/
