//: # Control Flow
/*:
 Swift provides a variety of control flow statements. These include `while` loops to perform task multiple times; `if`, `guard` and `switch` statements to execute different branches of code based on certain conditions; and statements such as `break` and `continue` to transfer the flow of execution to another point in your code

 Swift also provides for `for-in` loop that makes it easy to iterate over arrays, dictionaries, ranges, strings and other sequences

 Swift's `switch` statement is also considerably more powerful than its counterpart in many C-like languages. The cases of a `switch` statement do not "fall through" to the next case in Swift, avoiding common C errors caused by missing `break` statements. Cases can match many different patterns, including interval matches, tuples and casts to a specific type. Matched values in a `switch` case can be bound to temporary constants for use within the case's body, and complex matching conditions can be expessed with a `where` clause for each case.
*/

//: ## For-In Loops
/*:
You use the `for-in` loop to iterate over a sequence, such as ranges of numbers, items in an array, or characters in a string
*/
for index in 1...5 {
    print("\(index) times 5 is \(index * 5)")
}

/*: 
 The sequence being iterated is a range of numbers from `1` to `5`, inclusive, as indicated by the use of the close range operator (`...`). The value of `index` is set to the first number in the range (`1`), and statements inside the loop are executed

 If you don't need each value from a sequence, you can ignore the values by using an underscore in place of variable name
*/
let base = 3
let power = 10
var answer = 1
for _ in 1...power {
    answer *= base
}
print("\(base) to the power of \(power) is \(answer)")

//: Use a `for-in` loop with an array to iterate over its items
let names = ["Anna", "Alex", "Brian", "Jack"]
for name in names {
    print("Hello, \(name)")
}

// You can iterate over a dictionary to access its key-value pairs
let numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
for (animalName, legCount) in numberOfLegs {
    print("\(animalName)s have \(legCount) legs")
}
//: Move on to [While Loops](@next)
