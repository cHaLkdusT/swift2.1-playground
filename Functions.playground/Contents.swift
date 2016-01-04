/// FUNCTIONS

/// DEFINING AND CALLING FUNCTIONS
func sayHello(personName: String) -> String {
    let greeting = "Hello, " + personName + "!"
    return greeting
}

print(sayHello("Anna"))
print(sayHello("Brian"))

func sayHelloAgain(personName: String) -> String {
    return "Hello, " + personName + "!"
}
print(sayHelloAgain("Anna"))

/// FUNCTION PARAMETERS AND RETURN VALUES
/// FUNCTIONS WITHOUT PARAMETERS
func sayHelloWorld() -> String {
    return "Hello, world"
}
sayHelloWorld()

/// FUNCTIONS WITH MULTIPLE PARAMETERS
func sayHello(personName: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return sayHelloAgain(personName)
    } else {
        return sayHello(personName)
    }
}
print(sayHello("Tim", alreadyGreeted: true))

/// FUNCTIONS WITHOUT RETURN TYPES
func sayGoodbye(personName: String) -> () {
    print("Goodbye, \(personName)")
}
sayGoodbye("Dave")

// Functions without a defined return type return a special value of type Void. This is simply an empty tupble, in effect a tuple with zero elements, which can be written as ()

func printAndCount(stringToPrint: String) -> Int {
    print(stringToPrint)
    return stringToPrint.characters.count
}
func printWithoutCounting(stringToPrint: String) {
    printAndCount(stringToPrint)
}

printAndCount("Hello, world")
printWithoutCounting("Hello, world")

/// FUNCTIONS WITH MULTIPLE RETURN VALUES
func minMax(array: [Int]) -> (min: Int, max: Int) {
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
let bounds = minMax([8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

/// OPTIONAL TUPLE RETURN TYPES
func minMaxOptional(array: [Int]) -> (min: Int, max: Int)? {
    if array.isEmpty {
        return nil
    }
    var currentMin = array[0]
    var currentMax = array[0]
    for value in array[1..<array.count] {
        if value < currentMin {
            currentMin = value
        } else if value > currentMax {
            currentMax = value
        }
    }
    return (currentMin, currentMax)
}
if let boundsOptional = minMaxOptional([8, -6, 2, 109, 3, 71]) {
    print("min is \(boundsOptional.min) and max is \(boundsOptional.max)")
}

/// FUNCTION PAREMETERS NAMES
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to the argument values for the first and second paramenter
}
someFunction(1, secondParameterName: 2)

/// SPECIFYING EXTERNAL PARAMETER NAMES
func someFunction(externalParameterName localParameterName: Int) {
    // funciton body goes here, and can use localParameterName to refer to the argument value for that parameter
}

func sayHello(to person:String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
print(sayHello(to: "Bill", and: "Ted"))

/// OMITTING EXTERNAL PARAMETER NAMES
func someFunctionOptional(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes ehre
    // firstParameterName and secondParameterName refer to the argument values for the first and second parameters
}
someFunctionOptional(1, 2)

/// DEFAULT PARAMETER VALUES
func someFunctionDefault(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no argment are passed to the function call, value of parameterWithDefaul is 42
}
someFunctionDefault(6)
someFunctionDefault()

/// VARIADIC PARAMETERS
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)

func requiredDefaultedVariadic(name: String, age: Int = 0, gender: Bool = true, numbers: String...) {
    print(numbers.count)
}
requiredDefaultedVariadic("Julius", age: 1, numbers: "1", "2", "3", "4", "5")

/// CONSTANT AND VARIABLE PARAMETERS
func alignRight(var string: String, totalLength: Int, pad: Character) -> String {
    let amountToPad = totalLength - string.characters.count
    if amountToPad < 1 {
        return string
    }
    let padString = String(pad)
    for _ in 1...amountToPad {
        string = padString + string
    }
    return string
}
let originalString = "hello"
let paddedString = alignRight(originalString, totalLength: 10, pad: "-")

/// IN-OUT PARAMETERS
// in-out parameters cannot have default values
// variadic parameters cannot be mared as inout
// if you mark a parameter as inout, it cannot also be marked as var or let

func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
someInt
anotherInt

/// FUNCTION TYPES
func addTwoInts(a: Int, _ b: Int) -> Int {
    return a + b
}
func multiplyTowInts(a: Int, _ b: Int) -> Int {
    return a * b
}

/// USING FUNCTION TYPES
var mathFunction: (Int, Int) -> Int = addTwoInts
print("Result: \(mathFunction(2, 3))")

mathFunction = multiplyTowInts
print("Result: \(mathFunction(2, 3))")

let anotherMathFunction = addTwoInts

/// FUNCTION TYPES AS PARAMETER TYPES
func printMathResult(mathFunction: (Int, Int) -> Int, _ a: Int, _ b: Int) {
    print("Result: \(mathFunction(a, b))")
}
printMathResult(addTwoInts, 3, 5)

/// FUNCTION TYPES AS RETURN TYPES
func stepForward(input: Int) -> Int {
    return input + 1
}
func stepBackward(input: Int) -> Int {
    return input - 1
}
func chooseStepFunction(backwards: Bool) -> (Int) -> Int {
    return backwards ? stepBackward : stepForward
}

var currentValue = 3
let moveNearerToZero = chooseStepFunction(currentValue > 0)
print("Counting to zero:")
while currentValue != 0 {
    print("\(currentValue)... ")
    currentValue = moveNearerToZero(currentValue)
}
print("zero!")

/// NESTED FUNCTIONS
func chooseStepFunction2(backwards: Bool) -> (Int) -> Int {
    func stepForward(input: Int) -> Int { return input + 1 }
    func stepBackward(input: Int) -> Int { return input - 1 }
    return backwards ? stepBackward : stepForward
}
currentValue = 4
let moveNearerToZero2 = chooseStepFunction2(currentValue > 0)
while currentValue != 0 {
    print("\(currentValue)...")
    currentValue = moveNearerToZero2(currentValue)
}
print("zero!")

