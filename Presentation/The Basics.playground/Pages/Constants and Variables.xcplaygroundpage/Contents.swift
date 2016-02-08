//: Previous [Introduction](@previous)
//: # CONSTANTS AND VARIABLES
//: ## Declaring Constants and Variables
//: The value of a **constant** cannot be changed once it is set. A **variable** can be set to a different value in future. Constants and variables must be declared before they are used. You declared constants with the let keyword and variables with var keyword.
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
//: Declare multiple constants or multiple variables on a single line, separated by comma
var x = 0.0, y = 0.0, z = 0.0
//: ## Type Annotations
//: You can provide a type annotation when you declare a constant or variable, to be clear about the kind of values the constant or variable can store.
var welcomeMessage: String
//: welcomeMessage can now be set to any string value without error
welcomeMessage = "hello"
//: You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name
var red, green, blue: Double
//: ## Naming constants and variables
/*: Can contain almost any character, including Unicode characters
* Constants and variables cannot contain whitespace characters, mathematical symbols, arrows, private-use (invalid) Unicode code points, or line- and box-drawing characters.
* Cannot start with number, although numbers may be included elsewhere within the name
* Once you’ve declared a constant or variable of a certain type, you can’t redeclare it again with the same name, or change it to store values of a different type.
*/
let π = 3.14156
let 你好 = ""
let 🐶🐮 = "dogcow"
let 🐶 = "dog"
print(🐶 + 🐶🐮)
//: If you need to give a constant or variable with the name as a reserved Swift keyword, surround the keyword with back ticks (`) when using it as a name.
var `var` = "var string"
print(`var`)
//: You can change the value of an existing variable to another value of a compatible type.
var friendlyWelcome = "hellow!"
friendlyWelcome = "Bnojour"
//: Unlike varible, a value of a constant cannot be changed once it is set.
let languageName = "Swift"
//languageName = "Java"
//: ## Printing constants and variables
//: You can print the current value of a constant or variable using the `print(_:separator:terminator:)` function
print("hello", "chalk", separator: ", ", terminator: "\n")
print("world")
//: Swift uses string interpolation to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable.
print("The current value of languageName is \(languageName)")
/*:
> How to print a value without a line break after it?
*/
//: Move on to [Comments and Semicolons](@next)
