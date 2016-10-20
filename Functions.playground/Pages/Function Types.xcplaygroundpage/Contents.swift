//: Previous [Function Parameter Names](@previous)
//: ## Function Types
//: Every function has a specifi _function type_, made up of the parameter types and return type of the function
func addTwoInts(_ a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTowInts(_ a: Int, _ b: Int) -> Int {
    return a * b
}
/*:
 This example defines two simple mathematical functions called `addTwoInts` and `multipleTwoInts`. These functions each take two `Int` values, and return an `Int` value, which is the result of performing an appropriate mathematical operation.

 The type of both these functions is `(Int, Int) -> Int`

 Here' another example, for a function with no parameters or return value
*/
func printHelloWorld() {
    print("hello, world")
}
//: The type of this function is `() -> Void`

//: ## Using Function Types
//: You use function types just like any other types in Swift. For example, you can define a constant or variable to be of a function type and assign an appropriate function to that variable
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")
//: A different function with the same matching type can be assigned to the same varible, in the same way as for non-function types:
mathFunction = multiplyTowInts
print("Result: \(mathFunction(2, 3))")
//: As with any other type, you can leave it to Swift to infer the function type when you assign a function to a constant or variable
let anotherMathFunction = addTwoInts

//: ### Function Types as Parameter Types
// You can use a function type such as `(Int, Int) -> Int` as a parameter type for another function. This enables you to leave some aspect of a function's implementation for the function's caller to provide when the function is called.
func printMathResult(_ mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

//: Function Types as Return Types
//: You can use a function type as the return type of another function. You do this by writing a complete function type immediately after the return arrow (`->`) of the returning function
func stepForward(_ input: Int) -> Int {
    return input + 1
}
func stepBackward(_ input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backward: Bool) -> (Int) -> Int {
    return backward ? stepBackward : stepForward
}
var currentValue = 3
let moveNearerToZero = chooseStepFunction(backward: currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")
//: Move on to [Nested Functions](@next)
