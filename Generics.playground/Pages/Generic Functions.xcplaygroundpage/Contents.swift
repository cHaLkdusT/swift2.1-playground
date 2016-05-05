//: Previous [Generics](@previous)
//: ## Generic Functions
//: _Generic functions_ can work with any type. Here's a generic version of the `swapTwoInts(_:_:)` function from above, called `swapTwoValues(_:_:)`:
func swapTwoValues<T>(inout a: T, inout _ b: T) {
    let temporaryA = a
    a = b
    b = temporaryA
}
//: The body of the `swapTwoValues(_:_:)` function is identical to the body of the `swapTwoInts(_:_:)` function. However, the first line of `swapTwoValues(_:_:)` is slightly different from `swapTwoInts(_:_:)`. Here's how the first line compare:
// func swapTwoInts(inout a: Int, inout _ b: Int)
// func swapTwoValues<T>(inout a: T, inout _ b: T)
/*:
 The generic version of the function uses a _placeholder_ type name (called `T`, in this case) instead of an _actual_ type name (such as `Int`, `String`, or `Double`). The placeholder type nme doesn't say anything about what `T` must be, but it _does_ say that both `a` and `b` must be of the same type `T`, whatever `T` represents. The actual type of use in place of `T` will be determined each time the `swapTwoValues(_:_:)` function is called.
 
 The other difference is that the generic function's name (`swapTwoValues(_:_:)`) is followed by the placeholder type name (`T`) inside angle brackets (`<T>`). The brackets tell Swift that `T` is a place type name within the `swapTwoValues(_:_:)` function definition. Because `T` is a placeholder, Swift does not look for an actual type called `T`.
 
 The `swapTwoValues(_:_:)` function can now be called in the same way as `swapTwoInts`, except that it can be passed two values of _any_ type, as long as both of those values are of the same type as each other. Each time `swapTwoValues(_:_:)` is called, the type to use for `T` is inferred from the types of values passed to the function.
 
 In the two examples below, `T` is inferred to be `Int` and `String` respectively:
 */
var someInt = 3
var anotherInt = 107
swapTwoValues(&someInt, &anotherInt)

var someString = "Hello"
var anotherString = "World"
swapTwoValues(&someString, &anotherString)
/*: 
 NOTE: The `swapTwoValues(_:_:)` function defined above is inspired by a generic function called `swap`, which is a part of the Swift standard library, and is automatically made available for you to use in you apps. If you need the behavior of the `swapTwoValues(_:_:)` function in your own code, you can use Swift's existing `swap(_:_:)` function rather than providing your own implementation.
 */
//: Move on to [Type Parameters](@next)
