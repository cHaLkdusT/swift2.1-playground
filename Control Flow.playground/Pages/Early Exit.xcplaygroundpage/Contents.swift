//: Previous [Control Transfer Statements](@previous)
//: ## Early Exit
//: A `guard` statement, like an `if` statement, executes statements depending on the Boolean value of an expression. YOu use a `guard` statement to require that a condition must be true in order for the code after the `guard` statement to be executed. Unlike an `if` statement, a `guard` statement always has an else clause - the code inside the `else` clause is executed if the condition is not true.
func greet(person: [String: String]) {
    guard let name = person["name"] else {
        return
    }
    print("Hello \(name)!")
    
    guard let location = person["location"] else {
        print("I hope the weather is nice near you.")
        return
    }
    print("I hope the weather is nice in \(location)")
}
greet(person: ["names": "John"])
greet(person: ["name": "Jane", "location": "Cupertino"])
/*:
If the `guard` statement's condition is met, code execution continues after the `guard` statement's closing brace. Any variables or constants that were assigned values using an optional binding as part of the condition are available for the rest of the code block that the `guard` statement appears in.
If the condition is not met, the code inside the `else` branch is executed. That branch must transfer control to exit the code block in which the `guard` statement appears. It can do this with a control transfer statement such as `return`, `break`, `continue`, or `throw`, or it can call a function or method that doesn't return, such as `fatalError()`
*/
//: Move on to [Checking API Availability](@next)
