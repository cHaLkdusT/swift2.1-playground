//: Preivous [Strings and Characters](@previous)
//: ## Working with Characters
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

//: ## Concatenating Strings and Characters
//: `String` values can be added together with the addition operator (`+`) to create a new `String` value
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2
//: You can also append a `String` value to an existing `String` variable with the addition assigment operator (`+=`)
var instruction = "look over"
instruction += string2
//: You can append a `Character` value to a `String` with the `String` type's `append()` method
welcome.append(exclamationMark)

//: ## String Interpolation
//: It is a way to construct a new `String` value from a mix of constants, variable, literals and expressions by including their values inside a string literal. Each item tha tyou insert into the string literal is wrapped in a pair of parenthesis, prefixed by a backslash
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"
let i: Int? = nil
let nilI = "i equals \(i)"
//: > Note: The expressions you write inside parenthesis within an interpolated string cannot contain an unescaped backslash (`\`), a carriage return, or a line feed. However, they can contain other string literals.
//: Move on to [Unicode](@next)