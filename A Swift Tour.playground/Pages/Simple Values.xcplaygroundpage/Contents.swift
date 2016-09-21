//: Playground - noun: a place where people can play
//: # A Swift Tour
import UIKit

print("Hello, world!")

//: ## Simple Values
/*:
 Use `let` to make a constant and `var` to make a variable. The value of a constant doesn't need to be known at compile time, but you must assign it a value exactly once. This means you can use constants to name a value that you determine once but use in many places
 */
var myVariable = 42 // `myVariable` is an integer because its initial value is an integer
myVariable = 50
let myConstant = 42
/*:
 A constant or variable must have the same type as the value you want to assign to it. However, you don't always have to write the type explicitly. Providing a value when you create a constant or variable lets the compiler infer its type.
 */
let implicitInteger = 70
let implicitDouble = 70.0
let explicitDouble: Double = 70
//: **Experiment** Create a constant with an explicit type of `Float` and a value of `4`

/*:
 Values are never implicitly converted to another type. If you need to convert a value to different type, explicitly make an instant of the desired type.
 */
let label = "The width is "
let width = 94
let widthLabel = label + String(width)
//: **Experiment** Try removing the convertion to `String` from the last line. What error do you get?

//: There's even simpler way to include values in strings: Write the value in parenthesis, and write a backslash (`\`) before the parenthesis
let apples = 3
let oranges = 5
let appleSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit"
//: **Experiment** Use `\()` to include a floating-point calculation in a string and to include someone's nme in a greeting.

/*:
 Create arrays and dictionaries using brackets (`[]`), and access their elements by writing the index or key in brackets. A comma is allowed after the last element
 */
var shoppingList = ["catfish", "water", "tulips", "blue paint"]
shoppingList[1]

var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic",
]
occupations["Jayne"]
//: To create an empty array or dictionary, use the initializer syntax
let emptyArray = [String]()
let emptyDictionary = [String: Float]()
//: If the information can be inferred, you can write an empty array as `[]` and an empty dicitonary as `[:]`
shoppingList = []
occupations = [:]
//: Next [Control Flow](@next)
