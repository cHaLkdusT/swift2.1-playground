//: Previous [Trailing Closures](@previous)
//: ## Capturing Values
/*:
 A closure can _capture_ constants and variables from the surrounding context in which it is defined. The closure can then refer to and modify the values of those constants and variables withing its body, even if the original scope that defined the constants and variables no longer exists.
 
 In Swift, the simple form of a closure that can capture values is a nested function, writtend within the body of another function's argumetns and can also capture any constants and variables defined within the outer function.
*/
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
/*:
 The return type of `makeIncrementer` is `() -> Int`. This means that it returns a _function_, rather than a simple value. The function it returns has no parameters, and returns an `Int` value each time it is called.
 
 The `makeIncrementer(forIncrement:)` function defines an integer variable called `runningTotal`, to store the current running total of the incrementer that will be returned. This variable is initialized with a value of `0`
 
 > As an optimization, Swift may instead capture and store a _copy_ of a value if that value is not mutated by a clossure, and if the value is not mutated after the closure is create. Swfit also handles all memory management involved in disposing of variables when they are no longer needed.
*/
let incrementByTen = makeIncrementer(forIncrement: 10)
//: This example sets a constant called `incrementByTen` to refer to an incrementer function that adds `10` to its `runningTotal` variable each time it is called. Calling the function multiple times show this behavior in action:
incrementByTen()
incrementByTen()
incrementByTen()
//: If you create a second incrementer, it will have its own stored reference to a new, separate `runningTotal` variable
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
//: Calling the original incrementer (`incrementByTen`) again continues to increment its own `runningTotal` variable and does not affect the variable capture by `incrementBySeven`
incrementByTen()
incrementBySeven()
incrementBySeven()
//: > If you assign a closure to a property of a class instance and the closure captures that instance by refering to the instant or its members, you will create a strong reference cycle between the closure and the instance. Swift uses _capture lists_ to break these strong reference cycle.
//: Move on to [Closures Are Reference Types](@next)
