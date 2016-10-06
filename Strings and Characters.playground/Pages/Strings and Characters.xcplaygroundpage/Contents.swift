//: # Strings and Characters
/*:
A _string_ is a series of characters, such as `"hello, world"` or `"albatros"`.

Swift's `String` and `Character` types provide a fast, Unicode-compliant way to work with text in your code. The syntax for string creation and manipulation is lightweight and readable, with a strig literal syntax that is similar to C. String concatenation is as simple as combing two strings with the `+` operator, and string mutability is managed by choosing between a constant or a variable, just like any other value in Swift. You can also use strings to insert constants, variables, literals and expressions into longer string, in a process known as string interpolation. This makes it easy to create custom string values for display, storage and printing.
 
 Despite this simplicity of syntax, Swift's `String` type is a fast, modern string implementation. Every string is composed of encoding-independent Unicode character and provides support for accessing those character in various Unicode representations.
*/
/*:
> Note: Swift's `String` type is bridged with Foundation's `NSString` class. If you are working with Foundation framework in Cocoa, the entire NSString API is available to call on any `String` value you created when type cast to NSString.
*/

//: ## String Literals
//: A string lietral is a fixed sequence of textual characters surrounded by a pair of double quotes (`""`)
let someString = "Some string literal value"

//: ## Initializing an Empty String
//: To create an empty `String` value as the starting point for building a longer string, either assign an empty string literal to a variable or initialize a new `String` instance with initializer syntax:
var emptyString = ""
var anotherEmptyString = String()
//: Find out whether a `String` value is empty by checking its Boolean `isEmpty` property
if emptyString.isEmpty {
    print("Nothing to see here")
}

//: ## String Mutability
//: You indicate whether a particular `String` can be modified by assigning it to a variable, or to a constant
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

//: ## Strings Are Value Types
//: Swift's `String` type is a _value type_. If you create a new `String` value, that `String` value is _copied_ when it is passed to a function or method, or when it is assigned to a constant or variable.
//: Move on to [Working with Characters](@next)
