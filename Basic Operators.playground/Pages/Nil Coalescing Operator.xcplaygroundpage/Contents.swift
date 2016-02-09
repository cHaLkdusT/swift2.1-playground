//: Previous [Ternary Conditional Operator](@previous)
//: ## Nil Coalescing Operator
//: The _nil coalescing operator_ (`a ?? b`) unwraps an optional `a` if it contains a value, or returns a default value `b` if `a` is `nil`.
// a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName // Uses short-circuit evaluation

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//: Move on to [Range Operators](@next)