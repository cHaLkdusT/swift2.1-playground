//: Previous [Capturing Values](@previous)
//: ## Closures Are Reference Types
/*:
 In the example previously, `incrementBySeven` and `incrementByTen` are constants, but the closures these constants refer to are still able to increment the `runningTotal` variables that they have captured. This is because functions and closures are _reference types_.
 
 Whenever you assign a function or a closure to a constant or a variable, you are actually setting that constant or variable to be a _reference_ to the function or closure. In the example previously, it is the choice of closure that `incrementByTen` _refers to_ that is constant, and not the contents of the closure itself.
 
 This also means that if you assign a closure to two different constants or variables, both of those constants or variables will refer to the same closure:
*/
func makeIncrementer(forIncrement amount: Int) -> () -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
//: Move on to [Escaping Closures](@next)
