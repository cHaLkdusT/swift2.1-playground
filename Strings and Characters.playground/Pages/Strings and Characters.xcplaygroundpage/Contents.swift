//: ## Strings and Characters
/*:
A _string_ is a series of characters, such as `"hello, world"` or `"albatros"`.

Swift's `String` and `Character` types provide a fast, Unicode-compliant way to work with text in your code.
*/
/*:
> Swift's `String` type is bridged with Foundation's `NSString` class. If you are working with Foundation framework in Cocoa, the entire NSString API is available to call on any `String` value you created when type cast to NSString.
*/
//: ### String Literals
//: A string lietral is a fixed sequence of textual characters surrounded by a pair of double quotes (`""`)
let someString = "Some string literal value"
//: ### Initializing an Empty String
var emptyString = ""
var anotherEmptyString = String()
//: Find out whether a `String` value is empty by checking its Boolean `isEmpty` property
if emptyString.isEmpty {
    print("Nothing to see here")
}
//: ### String Mutability
//: You indicate whether a particular `String` can be modified by assigning it to a variable, or to a constant
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"
//: ### Strings Are Value Types
//: Swift's `String` type is a _value type_. If you create a new `String` value, that `String` value is _copied_ when it is passed to a function or method, or when it is assigned to a constant or variable.
//: ### Working with Characters
//: You can access the individual `Character` values for a `String` by iterating over its `characters` property with a `for-in` loop
for character in "Dog!🐶".characters {
    print(character)
}
//: You can create a stand-alone `Character` constant or variable from a single-character string literal by providing a `Character` type annotation
let exclamationMark: Character = "!"
//: `String` values can be constructed by passing an array of `Character` values as an argument to its initializer
let catCharacters: [Character] = ["c", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)
//: ### Concatenating Strings and Characters
//: `String` values can be added together with the addition operator (`+`) to create a new `String` value
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//: You can also append a `String` value to an existing `String` variable with the addition assigment operator (`+=`)
var instruction = "look over"
instruction += string2
//: You can append a `Character` value to a `String` with the `String` type's `append()` method
welcome.append(exclamationMark)
//: ### String Interpolation
//: It is a way to construct a new `String` value from a mix of constants, variable, literals and expressions by including their values inside a string literal. Each item tha tyou insert into the string literal is wrapped in a pair of parenthesis, prefixed by a backslash
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
//: Move on to [Unicode](@next)
