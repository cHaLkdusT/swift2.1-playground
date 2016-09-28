//: # Basic Operators
/*: 
An _operator_ is a special symbol or phrase that you use to check, change, or combine values. For example, the addition operator (`+`) adds two numbers, as in `let i = 1 + 2`, and the logical AND operator (`&&`) combines two Boolean values, as in `if enteredDoorCode && passedRetinaScan`

Swift supports most standard C operators and improves several capabilities to eliminate common coding errors. The assignment operator (`=`) does not return a value, to prevent it from being mistakenly used when the equal to operator (`==`) is intended. 

Arithmetic operators (`+`, `-`, `*`, `/`, `%` and so forth) detect and disallow value overflow, to avoid unexpected results when working with numbers that become larger or smaller than the allowed value range of the type that stores them. You can opt in to value overflow behaviour using Swift's overfow operators

Swift also provides two range operators (`a..<b` and `a...b`) not found in C, as a shortcut for expressing a range of values.
*/

//: ## Terminology
/*:
* _Unary_ operator operate on a single target (such as `-a). Unary _prefix_ operators appear immediately before their target (such as `!b`), and uniary _postfix_ operators appeart immediately after their target (such as `c!`)
* _Binary_ operators operate on two targets (such as `2 + 3`) and are _infix_ because they appear in between their two targets
* _Ternary_ operators operate on three targets (such as `a ? b : c`)
*/
//: ## Assignment Operator
//: The _assignment operator_ (`a = b`) initializes or updates the values of `a` with the value of `b`
let b = 10
var a = 5
a = b // a is now equal to 10

//: If the right side of the assignemtn is a tuple with multiple values, its elements can be decomposed into multiple constants or values at once:
let (x, y) = (1, 2)
//: Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value.
// The following statement is not valid:
// if x = y { }
//: This feature prevents the assignment operator (`=`) from being used by accident when the equal to operator (`==`) is actually intended. By making `if x = y` invalid, Swift helps you to avoid these kinds of errors in your code

//: ## Arithmetic Operators
/*:
* Addition (`+`)
* Subraction (`-`)
* Multiplication (`*`)
* Division (`/`)
*/
//: Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators do not allow values to overflow by default. However, you can opt in to value overflow behavior by Swift's overflow operators  (such as `a &+ b`)
1 + 2
5 - 3
2 * 3
10.0 / 2.5
//: The addition operator is also supported for String concatenation (operator overloading)
"hello, " + "world"
//: Move on to [Remainder Operator](@next)
