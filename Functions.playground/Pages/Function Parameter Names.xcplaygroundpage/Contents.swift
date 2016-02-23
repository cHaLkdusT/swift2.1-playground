//: Previous [Functions](@previous)
//: ## Function Parameter Names
//: Function parameters have both an _external parameter name_ and a _local parameter name_. An external parameter name is used to label arguments passed to a function call. A local parameter name is used in the implementation of the function
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to the argument values for the first and second paramenter
}
someFunction(1, secondParameterName: 2)
//: By default, the first parameter omits its external name, and the second and subsequent parameters use their local name as their external name. All parameters must have unique local names. Although it's possible for multiple parameters to have the same external name, unique external names help make your code more readable
//: ### Specifying External Parameter Names
func someFunction(externalParameterName localParameterName: Int) {
    // funciton body goes here, and can use localParameterName to refer to the argument value for that parameter
}
//: Note: If you provide an external parameter name for a parameter, that external name must _always_ be used when you call the function
func sayHello(to person:String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
print(sayHello(to: "Bill", and: "Ted"))
//: The use of external parameter names can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent
//: ### Omitting External Parameter Names
//: If you do not want to use an external name for the second or subsequent parameters of a function, write an underscore (`_`) instead of an explicit external name for that parameter
func someFunctionOptional(firstParameterName: Int, _ secondParameterName: Int) {
    // function body goes ehre
    // firstParameterName and secondParameterName refer to the argument values for the first and second parameters
}
someFunctionOptional(1, 2)
//: Because the first parameter omits its external parameter name by default, explicitly writing an underscore is extraneous
//: ### Default Parameter Values
//: You can define a _default value_ for any parameter in a function by assigning a value to the parameter after that parameter's type. If a default value is defined, you can omit that parameter when calling the function.
func someFunctionDefault(parameterWithDefault: Int = 12) {
    // function body goes here
    // if no argment are passed to the function call, value of parameterWithDefaul is 42
}
someFunctionDefault(6)
someFunctionDefault()
//: Place parameters with default values at the end of a function's parameter list. This ensures that all calls to the function use the same order for their nondefault arguments, and makes it clear that the same function is being called in each case.
//: ### Variadic Parameters
/*: 
A _variadic parameters_ accepts zero more values of a specified type. You use a variadic parameter to specify that the parameter can be passed to varying number of input values when the function is called. Write variadic parameters by inserting perios characters (`...`) after the parameter's type name.

The values passed to a variadic parameter are made available within te functions's body as an array of the appropriate type.

A function may have at most one variadic parameter.
*/
func arithmeticMean(numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)
// Not in 2.2 anymore
func requiredDefaultedVariadic(name: String, age: Int = 0, gender: Bool = true, numbers: String...) {
    print(numbers.count)
}
requiredDefaultedVariadic("Julius", age: 1, numbers: "1", "2", "3", "4", "5")
// Not in 2.0 anymore. CONSTANT AND VARIABLE PARAMETERS
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
//: In-Out Parameters
/*:
Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can't change the value of a parameter by mistake. If you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an _in-out parameter_ instead.

You write an in-out parameter by placing the `inout` keyword at the start of its parameter definition. An in-out parameter has a value that is passed _in_ to the function, is modified by the function, and is passed back _out_ of the function to replace the original value.

You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified. You place an ampersnad (`&`) directly before a variable's name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.

In-out parameters cannot have default values, and variadic parameters cannot be marked as `inout`
*/
func swapTwoInts(inout a: Int, inout _ b: Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
// Not in 2.2 anymore. If you mark a parameter as inout, it cannot also be marked as var or let
//: Move on to [Function Types](@next)