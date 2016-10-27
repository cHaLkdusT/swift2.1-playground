//: Previous [Closures](@previous)
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
//: ## Trailing Closures
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
someFunctionThatTakesAClosure(closure: {
    // closure's body goes here
})

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

someFunctionThatTakesAClosure {
}
//: The string-sorting closure from the Closure Expresssion Syntax section above can be written outside of the `sort(_:)` method's parentheses as a trailing closure:
var reversed = names.sorted{ $0 > $1 }
reversed
reversed = names.sorted { $0 > $1 }

//: Trailing closures are most useful when the closure is sufficiently long that it is not possible to write it inline on a single line. As an example, Swift's `Array` type has a `map(_:)` method which takes a closure expression as its single argument. The closure is called once for each item in the array, and returns an alternative mapped value for that item.
let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]
//: The code above creates a dictionary of mappings between the integer and English-language versions of their names. It also defines an array of integers, ready to be converted into strings.
let strings = numbers.map { (number) -> String in
    var number = number
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}
//: Move on to [Capturing Values](@next)
