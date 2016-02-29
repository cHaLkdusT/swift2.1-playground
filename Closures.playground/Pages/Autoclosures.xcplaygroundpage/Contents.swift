//: Previous [Nonescaping Closures](@previous)
//: ## Autoclosures
/*:
An _autoclosure_ is a closure that is automatically created to wrap an expression that's being passed as an argument to a function. It doesn't take any arguments, and when it's called, it returns a value fo the expression that's wrapped inside of it. This syntactic convenience lets you omit braces around the function's parameter by writing a normal expression instead of an explicit cloure.
It's common to _call_ functions that take autoclosures, but it's not common to _implement_ that kind of function. For example, the `assert(condition:message:file:line:)` function takes an autoclosure for its `condition` and `message` parameters; its `condition` parameter is evaluated only in debug builds and its `message` parameter is evaluated only if `condition` is `false`
An autoclosure lets you delay evaluation, because the code inside isn't run until you call the closure. Delaying evaluation is useful for code that has side effects or is computationaly expensive, because it lets you control when that code is evaluated.
*/
var customersInLine = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
print(customersInLine.count)
let customerProvider = { customersInLine.removeAtIndex(0) }
print(customersInLine.count)
print("Now serving \(customerProvider())!")
print(customersInLine.count)
//: You get the same behavior of delayed evaluation when you pass a closure as an argument to a function
func serveCustomer(customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer { customersInLine.removeAtIndex(0) }
//: The `serveCustomer(_:)` function in the listing above takes an explicit closure that returns a customer's name. The version of `serveCustomer(_:)` below performs the same operation but, instaed of taking an explicity closure, it takes an autoclosure by marking its parameter with the `@autoclosure` attribute. Now you can call the function as if it took a `String` argumetn instead of a closure. The argumetn is automatically converted to a closure, because the `customerProvider` parameter is marked with the `@autoclosure` attribute.
func serveCustomer(@autoclosure customerProvider: () -> String) {
    print("Now serving \(customerProvider())!")
}
serveCustomer(customersInLine.removeAtIndex(0))
//: The `@autoclosure` attribute implies the `@noescape` attribute, which is described above in Nonescaping Closures. If you want an autoclosure that is allowed to escape, use the `@autoclosure(escaping)` form of the attribute.
var customerProviders: [() -> String] = []
func collectCustomerProvers(@autoclosure(escaping) customerProvider: () -> String) {
    customerProviders.append(customerProvider)
}
collectCustomerProvers(customersInLine.removeAtIndex(0))
collectCustomerProvers(customersInLine.removeAtIndex(0))
print("Collected \(customerProviders.count) closures.")
for customerProvider in customerProviders {
    print("Now serving \(customerProvider())!")
}
//: In the code above, instead of calling the closure passed to it as its `customerProvider` argumetn, the `collectCustomerProviders(_:)` function appends the closure to the `customerProviders` array.