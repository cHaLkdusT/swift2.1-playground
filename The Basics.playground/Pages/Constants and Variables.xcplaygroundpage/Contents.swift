//: Previous [Introduction](@previous)
/*: 
 ## Constants and Variables
 Constants and variables associate a name (such as `maximumNumberOfLoginAttempts` or `welcomeMessage) with a value of particular type (such as the number `10` or the string `"Hello"`. The value of a *constant* cannot be changed once it is set, whereas a *variable* can be set to a different value in the future.
 ### Declaring Constants and Variables
 Constants and variable must be declared before they are used. You declare constants with the `let` keyword and variables with `var` keyword.
 */

let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0
// Can be read as “Declare a new constant called `maximumNumberOfLoginAttempts`, and give it a value of `10`. Then, declare a new variable called `currentLoginAttempt`, and give it an initial value of `0`”
// The max number of allowed login attempt is declared as constant, because the max value never changes. The current login attempt counter is declared as a variable, because this value must be incremented after each failed login attempt

//: Declare multiple constants or multiple variables on a single line, separated by comma
var x = 0.0, y = 0.0, z = 0.0
//: **NOTE** If a stored value in your code is not going to change, always declare it as a constant with the `let` keyword. Use variable only for storing values that need to be able to change.

//: ### Type Annotations
//: You can provide a *type annotation* when you declare a constant or variable, to be clear about the kind of values the constant or variable can store. Write annotation by placing a colon after the constant or variable name, followed by space, followed by the name of the type to use
var welcomeMessage: String
//: welcomeMessage can now be set to any string value without error
welcomeMessage = "Helo"

//: You can define multiple related variables of the same type on a single line, separated by commas, with a single type annotation after the final variable name
var red, green, blue: Double
//: **NOTE** It is rare that you need to write type annotations in practice. If you provide an initial value for a constant or variable at the point that is defined, Swift can almost always infer the type to be used for that constant or variable as descripbed in Type Safety and Type Inference.

//: ### Naming Constants and Variables
/*: 
 Can contain almost any character, including Unicode characters
 * Constants and variables cannot contain whitespace characters, mathematical symbols, arrows, private-use (invalid) Unicode code points, or line- and box-drawing characters.
 * Cannot start with number, although numbers may be included elsewhere within the name
 * Once you’ve declared a constant or variable of a certain type, you can’t redeclare it again with the same name, or change it to store values of a different type.
*/
let π = 3.14159
let 你好 = "你好世界"
let 🐶🐮 = "dogcow"

//: **NOTE** If you need to give a constant or variable with the name as a reserved Swift keyword, surround the keyword with back ticks (`) when using it as a name.
var `var` = "var string"
print(`var`)

//: You can cahgne the value of an existing variable to another value of a compatible type.
var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour"

//: Unlike varible, a value of a constant cannot be changed once it is set.
let languageName = "Swift"
//languageName = "Swift++"

//: ### Printing Constants and Variables
//: You can print the current value of a constant or variable using the `print(_:separator:terminator:)` function
print(friendlyWelcome)
//: Swift uses *string interpolation* to include the name of a constant or variable as a placeholder in a longer string, and to prompt Swift to replace it with the current value of that constant or variable.
print("The current value of friendlyWelcome is \(friendlyWelcome)")
/*:
> How to print a value without a line break after it?
*/
//: Move on to [Comments and Semicolon](@next)
