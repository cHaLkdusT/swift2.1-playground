/// CLOSURES
/// CLOSURE EXPRESSIONS
/// THE SORT METHOD
let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
func backwards(s1: String, s2: String) -> Bool {
    return s1 > s2
}
var reversed = names.sort(backwards)

/// CLOSURE EXPRESSION SYNTAX
// { (parameters) -> return type in statements }

// Closure expression can use constant parameters, variable parameters, and inout parameters. Default values cannot be provided. 

reversed = names.sort({ (s1: String, s2: String) -> Bool in s1 > s2 })
reversed

/// INFERING TYPE FROM CONTEXT
reversed = names.sort({ s1, s2 in return s1 > s2 })
reversed

/// IMPLICIT RETURNS FROM SINGEL-EXPRESSION CLOSURES
reversed = names.sort({ s1, s2 in s1 > s2 })
reversed

/// SHORTHAND ARGUMENT NAMES
reversed = names.sort({ $0 > $1 })
reversed

/// OPERTOR FUNCTIONS
reversed = names.sort(>)
reversed

/// TRAILING CLOSURES
func someFunctionThatTakesAClosure(closure: () -> Void) {
    // function body goes here
}
someFunctionThatTakesAClosure({
    // closure's body goes here
})

someFunctionThatTakesAClosure() {
    // trailing closure's body goes here
}

reversed = names.sort { $0 > $1 }
reversed

let digitNames = [0: "Zero", 1: "One", 2: "Two", 3: "Three", 4: "Four", 5: "Five", 6: "Six", 7: "Seven", 8: "Eight", 9: "Nine"]
let numbers = [16, 58, 510]
let strings = numbers.map { (var number) -> String in
    var output = ""
    while number > 0 {
        output = digitNames[number % 10]! + output
        number /= 10
    }
    return output
}

/// CAPTURING VALUES
func makeIncrementer(forIncrement amount: Int) -> Void -> Int {
    var runningTotal = 0
    func incrementer() -> Int {
        runningTotal += amount
        return runningTotal
    }
    return incrementer
}
let incrementByTen = makeIncrementer(forIncrement: 10)
incrementByTen()
incrementByTen()
incrementByTen()
let incrementBySeven = makeIncrementer(forIncrement: 7)
incrementBySeven()
incrementByTen()
incrementBySeven()
incrementBySeven()

/// CLOSURES ARE REFERENCE TYPES
let alsoIncrementByTen = incrementByTen
alsoIncrementByTen()
