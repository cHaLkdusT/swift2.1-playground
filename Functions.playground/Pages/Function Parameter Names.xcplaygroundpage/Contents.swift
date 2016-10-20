//: Previous [Functions](@previous)
//: ## Function Parameter Names
//: Function parameters have both an _external parameter name_ and a _local parameter name_. An external parameter name is used to label arguments passed to a function call. A local parameter name is used in the implementation of the function
func someFunction(firstParameterName: Int, secondParameterName: Int) {
    // function body goes here
    // firstParameterName and secondParameterName refer to the argument values for the first and second paramenter
}
//: All parameters has both an _argument label_ and a _parameter name_. The argument label is used when calling the function; each argument is written in the function call with its argument label before it. The parameter name is used in the implementation of the function. By default, parameters use their parameter nme as their argument label.
someFunction(firstParameterName: 1, secondParameterName: 2)

//: ### Specifying External Parameter Names
func someFunction(argumentlabel parameterName: Int) {
    // In the function body goes here, and can use parameterName to refer to the argument value for that parameter
}
//: Here's a variation of the `greet(person:)` function that takes a person's name and hometown and returns a greeting:
func greet(person: String, from hometown: String) -> String {
    return "Hello \(person)! Glad you could visit from \(hometown)"
}

func sayHello(to person:String, and anotherPerson: String) -> String {
    return "Hello \(person) and \(anotherPerson)"
}
//: The use of argument labels can allow a function to be called in an expressive, sentence-like manner, while still providing a function body that is readable and clear in intent

//: ### Omitting External Parameter Names
//: If you do not want to use an external name for the second or subsequent parameters of a function, write an underscore (`_`) instead of an explicit external name for that parameter
func someFunction(_ firstParameterName: Int, secondParameterName: Int) {
    // function body goes ehre
    // firstParameterName and secondParameterName refer to the argument values for the first and second parameters
}
someFunction(1, secondParameterName: 2)
//: Because the first parameter omits its external parameter name by default, explicitly writing an underscore is extraneous

//: ### Default Parameter Values
//: You can define a _default value_ for any parameter in a function by assigning a value to the parameter after that parameter's type. If a default value is defined, you can omit that parameter when calling the function.
func someFunction(parameterWithoutDefault: Int, parameterWithDefault: Int = 12) {
    // function body goes here
    // if no argment are passed to the function call, value of parameterWithDefaul is 42
}
someFunction(parameterWithoutDefault: 3, parameterWithDefault: 6)
someFunction(parameterWithoutDefault: 4)
//: Place parameters that don't have default values at the end of a function's parameter list, before the parameter that have default values. This ensures that all calls to the function use the same order for their nondefault arguments, and makes it clear that the same function is being called in each case.

//: ### Variadic Parameters
/*: 
A _variadic parameters_ accepts zero more values of a specified type. You use a variadic parameter to specify that the parameter can be passed to varying number of input values when the function is called. Write variadic parameters by inserting perios characters (`...`) after the parameter's type name.

The values passed to a variadic parameter are made available within te functions's body as an array of the appropriate type.

A function may have at most one variadic parameter.
*/
func arithmeticMean(_ numbers: Double...) -> Double {
    var total: Double = 0
    for number in numbers {
        total += number
    }
    return total / Double(numbers.count)
}
arithmeticMean(1, 2, 3, 4, 5)
arithmeticMean(3, 8.25, 18.75)
//: > A function may have at most one variadic parameter

/*: 
 In-Out Parameters

 Function parameters are constants by default. Trying to change the value of a function parameter from within the body of that function results in a compile-time error. This means that you can't change the value of a parameter by mistake. If you want a function to modify a parameter's value, and you want those changes to persist after the function call has ended, define that parameter as an _in-out parameter_ instead.

 You write an in-out parameter by placing the `inout` keyword at the start of its parameter definition. An in-out parameter has a value that is passed _in_ to the function, is modified by the function, and is passed back _out_ of the function to replace the original value.

 You can only pass a variable as the argument for an in-out parameter. You cannot pass a constant or a literal value as the argument, because constants and literals cannot be modified. You place an ampersnad (`&`) directly before a variable's name when you pass it as an argument to an in-out parameter, to indicate that it can be modified by the function.

 > In-out parameters cannot have default values, and variadic parameters cannot be marked as `inout`
*/
func swapTwoInts(_ a: inout Int, _ b: inout Int) {
    let temporaryA = a
    a = b
    b = temporaryA
}
var someInt = 3
var anotherInt = 107
swapTwoInts(&someInt, &anotherInt)
print("someInt is now \(someInt), and anotherInt is now \(anotherInt)")
//: In-out parameters are not the same as returning a value from a function. The `swapTwoInts` example above does not define a return type or a return value, but it still modifies the values of `someInt` and `anotherInt`. In-out parameters are an alternative way for a fucntion to have an effect outside of the scope of its function body.

//: Move on to [Function Types](@next)
