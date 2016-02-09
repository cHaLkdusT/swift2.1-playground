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
//: Move on to [Ternary Conditional Operator](@next)