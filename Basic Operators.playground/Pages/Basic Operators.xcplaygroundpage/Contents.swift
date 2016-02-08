//: # Basic Operators
/*: 
An _operator_ is a special symbol or phrase that you use to check, change, or combine values. More complex examples include the logical AND operators `&&` and the increment operator `++i`, which is a shortcut to increase the value of `i` by `1`

Swift supports most standard C operators and improves several capabilities to eliminate common coding errors. The assignment operator (`=`) does not return a value, to prevent it from being mistakenly used when the equal to operator (`==`) is intended. 

Arithmetic operators (`+`, `-`, `*`, `/`, `%` and so forth) detect and disallow value overflow, to avoid unexpected results when working with numbers that become larger or smaller than the allowed value range of the type that stores them. You can opt in to value overflow behaviour using Swift's overfow operators

Unlike C, Swift lets you perform remainder (%) calculations on floating numbers. Swift also provides two range operators (`a..<b` and `a...b`) not found in C, as a shortcut for expressing a range of values.
*/
//: ## Terminology
/*:
* _Unary_ operator operate on a single target (such as `-a)
* _Binary_ operators operate on two targets (such as `2 + 3`) and are _infix_ 
* _Ternary_ operators operate on three targets (such as `a ? b : c`)
*/
//: ## Assignment Operator
//: The _assignment operator_ (`a = b`) initializes or updates the values of `a` with the value of `b`
let maxInt8: Int8 = Int8.max
//maxInt8++
let b = 10
var a = 5
a = b // a is now equal to 10

let (x, y) = (1, 2)
x
y
//: Unlike the assignment operator in C and Objective-C, the assignment operator in Swift does not itself return a value. This feature prevents the assignment operator (`=`) from being used by accident when the equal to operator (`==`) is actually needed.
// The following statement is not valid:
// if x = y { }
//: ## Arithmetic Operators
/*:
* Addition (`+`)
* Subraction (`-`)
* Multiplication (`*`)
* Division (`/`)
*/
//: Unlike the arithmetic operators in C and Objective-C, the Swift arithmetic operators do not allow values to overflow by default. However, you can opt in to value overflow behavior by Swift's overflow operators
1 + 2
5 - 3
2 * 3
10.0 / 2.5
//: The addition operator is also supported for String concatenation (operator overloading)
"hello, " + "world"

class Fraction {
    var wholeNumber: Int?
    var numerator: Int?
    var denominator: Int?
}
let f1 = Fraction()
let f2 = f1//Fraction()
f1 === f2 ? true : false

func + (f1: Fraction, f2: Fraction) -> Fraction {
    return Fraction()
}
func - (f1: Fraction, f2: Fraction) -> Fraction {
    return Fraction()
}
let f3 = f1 - f2


//: ### Remainder Operator
/*: 
The _remainder operator_ (`a % b`) works out on how many multiples of `b` will fit inside `a` and returns the value that is left over (known as _remainder_)

The remainder operator (`%`) is also known as _modulo operator_ in other languages. However, its behavior in Swift for negative numbers means that it is, strictly speaking, a remainder rathern than a modulo operation
*/
/*: 
Here's how the remainder operator works. To calculate `9 % 4`
![Remainder Integer](remainderInteger_2x.png "Remainder Integer")
*/
9 % 4
-9 % 4
-9 % -4
9 % -4
//: The sign of `b` is ignored for negative values of `b`. This means that `a % b` and `a % -b` always give the same answer

//: ### Floating-Point Reminder Calculations
//: Unlike the reminder operator in C and Objective-C, Swift's remainder operator can also operate on floating-point numbers
8 % 2.5
-8 % 2.5
//: ![Remainder Float](remainderFloat_2x.png "Remainder Float")

//: ### Increment and Decrement Operators
//: Like C, Swift provides an _increment operator_ (`++`) and a _decrement operator_ (`--`) as a shortcut to increase or decrease the value of a numeric variable by `1`
var i = 0
++i

//: If the operator is written _before_ the variable, it increments the variable _before_ returning its value
var c = 0
let d = ++c
c
//: If the operator is writtent _after_ the variable, it increments the variable _after_ returning its value
let e = c++
c
/*:
> Note: Unless you need the specific behavior of `i++`, it is recommended that you use `++i` and `--i` in all cases because they have typical expected behavior of modifying `i` and returning the result.
*/
//: ### Unary Minus Operator
//: The sign of numeric value can be toggled using a prefixed `-`. It is prepended directly before the value it operates on, without any white space.
let three = 3
let minusThree = -three
let plusThree = -minusThree
//: ### Unary Plus Operator
//: Simply returns the value it operates on, without any changes. Although the unary plus operator doesn't actually do anything, you can use it to provide symmetry in your code for positive numbers when also using the unary minus operator for negative numbers
//var minusSix = 06
//minusSix = +06
//let alsoMinusSix = +minusSix

let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
//: ## Compound Assignment Operators
//: Like C, Swift provides _compound assignment operators_ that combine assignment (`=`) with another operation. The expression `a += 2` is a shorthand for `a = a + 2`
var f = 1 // f = f + 2
f += 2
/*:
> Note: The compound assignment operators do not return a value. You cannot write `let b = a += 2`.
*/
//: ## Comparison Operators
1 == 1 // Equal to
2 != 1 // Not equal to
2 > 1 // Greater than
1 < 2 // Less than
1 >= 1 // Greater than or equal to
2 <= 1 // Less than or equal to
/*:
> Swift also provides two _identity operators (`===` and `!==`), which you use to test whether two object references both refer to the same object instance
*/
var name = "world"
var name2 = name
if name == "world" {
    print("hello, world!")
} else {
    print("I'm sorry \(name), but I dont' recognize you")
}
//: ## Ternary Conditional Operator
//: It is a special operatorwith three parts, which takes the form `question ? answer1 : answer2`.
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? hasHeader ? 50 : 20 : hasHeader ? 50 : 20)
//: ## Nil Coalescing Operator
//: The _nil coalescing operator_ (`a ?? b`) unwraps an opational a if it contains a value, or returns a default value `b` if `a` is `nil`.
// a != nil ? a! : b
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName // Uses short-circuit evaluation

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName
//: ## Range Operators
//: Swift includes two _range operators_, which are shortcuts for expressing a range of values.
//: ### Close Range Operator
//: (`a...b`) Defines a range that runs from `a` to `b` and includes the values `a` and `b`. The value of `a` must not be greater than `b`.
for index in 1...5 {
    print("\(index) times 5 i s \(index * 5)")
}
//: ### Half-open Range Operator
//: (`a..<b`) defines a range that runs from `a` to `b`, but does not include `b`.
let names = ["Anna", "Alex", "Brian", "Jack",]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i]).")
}
//: Move on to [Logical Operators](@next)
