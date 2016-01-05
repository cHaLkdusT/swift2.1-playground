//: Previous: [Comments and Semicolon](@previous)
//: # INTEGERS
//: _Integers_ are whole numbers with no fractional component, such as `42` and `-23`. Integers are either  _signed_ (positive, zero, or negative) or _unsigned_ (positive or zeror).
//: Swift provides signed and unsigned integers in 8, 16, 32, and 64 bit forms. These integers follow a naming convention similar to C, in that an 8-bit unsigned integer is of type `UInt8`, and a 32-bit signed integer is of type `Int32`.
//: ## Integer bounds
//: You can access the minimum and maximum values of each integer type with its min and max properties
let minValue = UInt8.min
let maxValue = UInt8.max

//: ## Int
//: In most cases, you don't need to pick a specific size of integer to use in your code. Swift provides an additional integer type , `Int`, which has the same size as the current platform's native word size:
/*: 
* On a 32-bit platform, Int is the same size as `Int32`
* On a 64-bit platform, Int is the same size as `Int64`
*/
//: ## UInt
//: Swift also provides unsigned integer type, `UInt`, which has the same szie as the current platforms' native word size:
/*:
* On a 32-bit platform, UInt is the same size as `UInt32`
* On a 64-bit platform, UInt is the same size as `UInt64`
*/
//: # Floating-Point Numbers
//: _Floatin-point number_ are number with fractional component, such as 3.14159, 0.1, and -273.15. Floating-point types an represent a much wider range of values than integer types, and can store numbers that are much larger or smaller than can be stored in an `Int`. Swift provides two signed floating-point number types:
/*:
* `Double` represents a 64-bit floating-point number
* `Float` represents a 32-bit floating-point number
*/
/*: 
* Decimal has a precision of at least 15 decimal digits
* Float has a precision of 6 decimal digits
*/
// Double if preferred
//: Move on to [Type Safety and Type Inference](@next)
