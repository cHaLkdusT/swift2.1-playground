//: # Closures
/*:
 _Closures_ are self-contained blocks of functionality that can be passed around and used in your code. Closures in Swift are similar to blocks in C and Objective-C and to lambdas in other programming languages.

 Closures can capture and store references to any constants and variables from the context in which they are defined. This is known as _closing over_ those constants and variables. Swift handles all of the memory management of capturing for you.

 Global and nested functions are actually special cases of closures. Closure takes on of three forms:
 * Global functions are closures that have a name and do not capture any values
 * Nested functions are closures that have a name and can capture from their enclosing function
 * Closure expressions are unnamed closures written in a lightweight syntax that can capture values from their surrounding context.

 Swift's closure expressions have a clean, clear style, with optimizations that encourages brief, clutter-free syntax in common scenarios. These optimizations include:
 * Inferring parameter and return value types from context
 * Implicit returns from single-expression closures
 * Shorthand argument names
 * Trailing closure syntax
*/

//: ## Closure Expressions
/*: 
 Nested functions, as introduced in Nested Functions, are a convenient means of naming and defining self-contained blocks of code as part of a larger function. However, it is sometimes useful to write shorter versions of function-like constructs without full declaration and name. This is particulary true when you work with functions or methods that take functions as one or more of their arguments.
 
 _Closure expressions_ are a way to write inline closures in a brief, focused syntax. Closure expressions provide several syntax optimizations for writing closures in a shortened form without loss of clarity or intent. The closure expression examples below illustrate these optimizations by refining a single example of the `sort(_:)` method over several iterations, each of which expresses the same functionality in more succinct way.
*/

//: ### The Sort Method
/*:
Swift's standard library provides a method called `sort(_:)`, which sorts an array of values of a known type, based on the output of a sorting closure that you provide. Once it completed the sorting process, the `sort(_:)` method returns new array of the same type and size as the old one, with its element in the correct sorted order. The original array is not modified by the `sort(_:)` method.
*/
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
/*:
The `sort(_:)` method accepts a closure that takes two argumetns of the same type as the array's content, and returns `Bool` value to say whether the first value should appear before or after the second value once the values are sorted. The sorting closure needs to return `true` if the first value should appear _before_ the second value, and `false` otherwise.
*/
func backward(_ s1: String, _ s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sorted(by: (backward))

//: ### Closure Expression Syntax
//: Closure expression syntax has the following general form:
// { (parameters) -> return type in statements }
//: Closure expression syntax can use constant parameters, variable parameters, and `inout` parameters. Default values cannot be provided. Variadic parameters can be used if you name the variadic parameter. Tuples can also be used as parameter types and return types
reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in s1 > s2 })
reversed

//: ### Inferring Type From Context
//: Because the sorting closure is passed as an argumetn to a method, Swift can infer the types of its parameters and the type of the value it returns. The `sort(_:)` method is being called on an array of strings, so its argumetn must be a function type of `(String, String) -> Bool`.
reversed = names.sorted(by: { s1, s2 in return s1 > s2 })
reversed

//: ### Implicit Returns from Single-Expression Closures
//: Single-expression closures can implicitly return the results of their single expression by omitting the `return` keyword from their declaration.
reversed = names.sorted(by: { s1, s2 in s1 > s2 })
reversed

//: ### Shorthand Argument Names
//: Swift automatically provides a shorthand argument names to inline closures, which can be used to refere to the values of the closure's arguments by the name `$0`, `$1`, `$2` and so on.
reversed = names.sorted(by: { $0 > $1 })
reversed

//: ### Operator Functions
//: There's actually an even _shorter_ way to write the closure expression above. Swift's `String` type defines its string-specific implementation of the greater-than operator (`>`) as a function that has two parameters of type `String`, and returns a value of type `Bool`.
reversed = names.sorted(by: >)
reversed
//: Move on to [Trailing Closures](@next)
