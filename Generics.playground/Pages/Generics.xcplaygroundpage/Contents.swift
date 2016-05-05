//: # Generics
/*:
 _Generic code_ enables you to write flexible, reusable functions and types that can work with any type, subject to requirements that you define. You can write code that avoid duplication and expresses its intent in a clear, abstracted manner.
 
 Generics are one of the most powerful features of Swfit, and much of the Swift standard library is built with generic code. In fact, you've been using generics thought the _Language Guide_, even if you didn't realize it. For example, Swift's `Array` and `Dictionary` types are both generic collections. You can create an array that holds `Int` values, or an array that holds `String` values, or indeed an array for any other type that can be created in Swift. Similarly, you can create a dictionary to store values of any specified type, and there no limitations on what the type can be.
 */
//: ## The Problem That Generics Solve
//: Here's a standart, non-generic function that called `swapTwoInts(_:_:)`, which swaps two `Int` values:
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
/*:
 This function makes use of in-out parameters to swap the values of `a` and `b`, as described in In-Out Parameters.
 
 The `swapTwoInts(_:_:)` function swaps the original value of `b` into `a`, and the original value of `a` into `b`. You can call this function to swap the values in two `Int` variables:
 */
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//: The `swapTwoInts(_:_:)` function is useful, but it can only be used with `Int` values. If you want to swap two `String` values, or two `Double` values, you have to write more functions, such as the `swapTwoStrings(_:_:)` and `swapTwoDoubles(_:_:)` functions shown below:
func swapTwoStrings(inout a: String, inout _ b: String) {
    let temporaryA = a
    a = b
    b = temporaryA
}
func swapTwoDoubls(inout a: Double, inout _ b: Double) {
    let temporaryA = a
    a = b
    b = temporaryA
}
/*:
 You may have noticed that the bodies of the `swapTwoInts(_:_:)`, `swapTwoStrings(_:_:)` and `swapTwoDoubles(_:_:)` functions are identical. The only difference is the type of the value that they accept (`Int`, `String`, and `Double`).
 
 It would be much more useful and considerably more flexible, to write a single function that could swap two values of _any_ type.
 
 Generic code enables you to write such a function. (A generic version of these functions is defined below.)
 
 NOTE: In all three functions, it is important that the types of `a` and `b` are defined to be of the same of each other. If `a` and `b` were not of the same type, it would not be possible to swap their values. Swift is a type-safe language, and does not allow (for example) a variable of type `String` and a variable of type `Double` to swap values with each other. Attempting to do so would be reported as a compile-time error.
 
 Move on to [Generic Functions](@next)
 */