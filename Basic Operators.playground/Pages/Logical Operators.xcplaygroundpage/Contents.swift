//: Previous [Range Operators](@previous)
//: ## Logical Operators
//: _Logical operators_ modify or combine the Boolean logic values `true` and `false`.
/*:
* Logical NOT (`!a`)
* Logical AND (`a && b`)
* Logical OR (`a || b`)
*/
//: ### Logical NOT Operator
//: (`!a`) invers a Boolean value so that `true` becomes `false`, and `false` become `true`. Careful choise of Boolean constant and variable names can help to kepp code readable and concise, while avoiding double negatives or confusing logic statements
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}
//: ### Logical AND Operator
//: (`a && b`) creates logical expression where both values must be `true` for the overall expression
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}
//: ### Logical OR Operator
//: (`a || b`) creates logical expression in which only _one_ of the two values has to be `true` for the overall expression to be `true`
let hasDoorKey = false
let knowsOverridePassword = true
if hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}
//: ### Combining Logical Operators
if enteredDoorCode && passedRetinaScan || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}
/*:
> The Swift logical operators `&&` and `||` are left-associative, meaning that compound expressions with multiple logical operators evaluate the leftmost subexpression first.
*/
//: ### Explicit Parenthesis
// The parenthesis make it clear that first two values are considered as part of separate possible state in the overall logic.
if (enteredDoorCode && passedRetinaScan) || hasDoorKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESSED DENIED")
}
