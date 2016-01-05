//: Previous [Assertions](@previous)
//: # Assertions
//: In some cases, it is simple not possible for your code to continue execution if a particular condition is not satisfied. In these situations, you can trigger an _assertion_ in your code to end code execution and to provide an opportunity to debug the cause of the absent of invalid value
//: ## Debugging with Assertions
/*: 
An assertion is a runtime check that a Boolean condition definitely evaluates to `true`. Literally put, an assertion "asserts" that a condition is true.

You write an assertion by calling the Swift standard library global `asset(_:_file:line:)` function. You pass this function an expression that evaluates to `true` or `false` and a message that should be displayed if the result of the condition is `false`:
*/
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")
/*: 
In this example, code execution will continue only if `age >= 0` evaluates to `true`, that is, if the value of `age` is non-negative.

Assertions are disabled when your code is compiled with optimizations, such as when building with an app target's defaul Release configuration in Xcode
*/
//: ## When to Use Assertions
/*:
* An integer subscript index is passed to  custom subscript implementation, but the subscript index value could be too low or too high
* A value is passed to a function, but an invalid value means that the funciton cannot fulfill its task.
* An optional value is currently `nil`, but non-`nil` value is essential for subsequent code to execute successfully.
*/
