//: Previous [Closures Are Reference Types](@previous)
//: ## Nonescaping Closures
//: A closure is said to _escape_ a function when the closures is passed as an argument to a function, but is called after the function return. When you declare that takes a closure as one of its parameters, you can write `@noescape` before the parameter name to indicate that the closure is not allowed to escape. Marking a closure with `@noescape` lets the compiler make more aggresive optimizations because it knows more information about closure's lifespan.
func someFunctionWithNonescapingClosure(@noescape closure: () -> Void) {
    closure()
}
/*: 
As an example, the `sort(_:)` method takes a closure as its parameter, which is used to compare elements. The parameter is mark `@noescape` because it is guaranteed no to be needed after sorting is complete
One way that a closure can escape is by being stored in a variable that is defined outside the function. As an example, many functions that start an asynchronous operation take a closure argument as a completion handler. The function returns after it starts the operation, but the closure isn't called until the operation is completed - the closure need to escape, to be called later.
*/
var completionHandlers: [() -> Void] = []
func someFunctionWithEscapingClosure(completionHandler: () -> Void) {
    completionHandlers.append(completionHandler)
}
/*:
The `someFunctionWithEscapingClosure(_:)` function takes a closure as its argument and adds it to an array that's declared outside the function. If you tried to mark the parameter of this with `@noescape`, you would get a compiler error.
Marking a closure with `@noescape` lets you refer to `self` implicitly within the closure.
*/
class SomeClass {
    var x = 10
    func doSomething() {
        someFunctionWithEscapingClosure { self.x = 100 }
        someFunctionWithNonescapingClosure { x = 200 }
    }
}

let instance = SomeClass()
instance.doSomething()
print(instance.x)

completionHandlers.first?()
print(instance.x)
//: Move on to [Autoclosures](@next)