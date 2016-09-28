//: Previous [Ternary Conditional Operator](@previous)
//: ## Nil Coalescing Operator
//: The _nil coalescing operator_ (`a ?? b`) unwraps an optional `a` if it contains a value, or returns a default value `b` if `a` is `nil`.
// a != nil ? a! : b
//: The code above uses the ternary conditional operator and forced unwrapping (`a!`) to access the value wrapped inside `a` when is not `nil`, and to return `b` otherwise. The nil-coalesing operator provides a more elegant way to encapsulate this conditional checking and unwrapping in a concise and readable form.
//: > Note: if the value of `a` is non-`nil`, the value of `b` is not evaluated. This is known as _short-circuit evaluation_.
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName // Uses short-circuit evaluation

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//: Move on to [Range Operators](@next)
