//: [Previous](@previous)
//: ## Nested Funcitons
/*: 
All of the functions you have encountered so far in this chapter have been examples of _global functions_, which are defined at a global scope. You can also defined functions inside the bodies of other functions, known as _nested functions_.

Nested functions are hidden from the outside world by default, but can still be called and used by their enclosing function. An enclosing function can also return one of its nested functions to allow the nested function to be used in another scope
*/
func chooseStepFunction2(backward: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backward ? stepBackward : stepForward
}
var currentValue = 4
let moveNearerToZero2 = chooseStepFunction2(backward: currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero2(currentValue)
}
print("zero!")