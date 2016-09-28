//: Previous [Unary Operator](@previous)
//: ## Compound Assignment Operators
//: Like C, Swift provides _compound assignment operators_ that combine assignment (`=`) with another operation. The expression `a += 2` is a shorthand for `a = a + 2`
var f = 1 // f = f + 2
f += 2
/*:
> Note: The compound assignment operators do not return a value. You cannot write `let b = a += 2`. A complete list of compound assignment operators can be found in Expressions
*/

//: ## Comparison Operators
1 == 1 // Equal to
2 != 1 // Not equal to
2 > 1 // Greater than
1 < 2 // Less than
1 >= 1 // Greater than or equal to
2 <= 1 // Less than or equal to
/*:
> Swift also provides two _identity operators (`===` and `!==`), which you use to test whether two object references both refer to the same object instance. See Classes and Structures
*/
var name = "world"
if name == "world" {
    print("hello, world!")
} else {
    print("I'm sorry \(name), but I dont' recognize you")
}

/*:
 You can also compare tuples that have the same number of values, as long as each of the values in the tuple can be compared. For example both `Int` and `String` can be compared, which means tuples of the type `(Int, String)` can be compared. In contrast, `Bool` can't be compared, which means tuples that contain Boolean values can't be compared.
 
 Tuples are compared from left to right, one value at a time, untile the comparison finds two values that aren't equal. If all elements are equal, then the tuples themselves are equal.
 */
(1, "zebra") < (2, "apple") // true because 1 is less than 2
(3, "apple") < (3, "bird") // true because 3 is equal to 3, and "apple" is less than "bird"
(4, "dog") == (4, "dog") // true because 4 is equal to 4, and "dog" is equal to "dog"
//: > Note: The Swift standard library includes tuple comparison operators for tuples with fewer than seven elements. To compare with seven or more elements, you must implement the comparison operators yourself.

//: Move on to [Ternary Conditional Operator](@next)
