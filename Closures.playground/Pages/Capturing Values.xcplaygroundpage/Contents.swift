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
*/
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
//: If you create a second incrementer, it will have its own stored reference to a new, separate `runningTotal` variable
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
//: Calling the origincal incrementer (`incrementByTen`) again continues to increment its own `runningTotal` variable and does not affect the variable capture by `incrementBySeven`
incrementByTen()
incrementBySeven()
incrementBySeven()
//: Move on to [Closures Are Reference Types](@next)
