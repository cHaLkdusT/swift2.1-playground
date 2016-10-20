//: # Functions
/*:
 _Functions_ are self-contained chunks of the code that perform a specific task. You give a function a name that identifies what it does, and this name is used to "call" the function to perform its task when needed.

 Swift's unified function syntax is flexible enough to express anything from a simple C-style function with no parameter names to a complex Objective-C-style method with local and external parameter names for each parameter. Parameters can provide default values to simplify function calls and can be passed as in-out parameters, which modify a passed variable once the function has completed its execution.

 Every function in Swift has a type, consisting of the function's parameter types and return type. You can use this type like any other type in Swift, which makes it easy to pass functions as parameters to other functions, and to return function from functions. Functions can also be written within other functions to encapsulate useful functionality within nested function scope.

 ## Defining and Calling Function
 When you define a function, you can optionally define one or more named, type values that function takes as input, known as _parameters_. You can also optionally define a type of value that the function will pass back as output when it is done, known as its _return type_.

 Every function has a _function name_, which describes the task the function performs. To use a function, you "call" that function with its name and pass it input values (known as _arguments_) that match the types of the function's parameters. A function's arguments must always be provided in the same order as the function's parameter list.
*/
func greet(person: String) -> String {
    let greeting = "Hello, " + person + "!"
    return greeting
}
//: All of this information is rolled up to the function's _definition_, which is prefixed with the `func` keyword. You indicate the function's return type with the _return arrow_ `->`, which is followed by the name of the type to return.

print(greet(person: "Anna"))
print(greet(person: "Brian"))
//: > The 'print(_:separator:terminator:)` function doesn't have a label for its first argument and its other argumetns are optional because they have a default value.
func greetAgain(person: String) -> String {
    return "Hello, " + person + "!"
}
print(greetAgain(person: "Anna"))

/*: 
 ## Function Parameters and Return Values
 
 Function parameters and return values are extremely flexible in Swift. You can defined anything from a simple utility function with a single unnamed parameter to a complex function with expressive parameter names and different parameter options

 ### Function Without Parameters
 Functions are not required to defined input parameters.
 */
func sayHelloWorld() -> String {
    return "Hello, world"
}
sayHelloWorld()

//: ### Function with Multiple Parameters
//: Functions can have multiple input parameters, which are written within the function's parenthesis, separated by commas.
func greet(person: String, alreadyGreeted: Bool) -> String {
    if alreadyGreeted {
        return greetAgain(person: person)
    } else {
        return greet(person: person)
    }
}
print(greet(person: "Tim", alreadyGreeted: true))

//: ### Functions Without Return Values
//: Functions are not required to define a return type.

func sayGoodbye(person: String) -> Void {
    print("Goodbye, \(person)!")
}
sayGoodbye(person: "Dave")

/*: 
Functions without a defined return type return a special value of type Void. This is simply an empty tuple, in effect a tuple with zero elements, which can be written as ()

The return value of a function can be ignored when it is called
*/
func printAndCount(string: String) -> Int {
    print(string)
    return string.characters.count
}
func printWithoutCounting(string: String) {
    let _ = printAndCount(string: string)
}
printAndCount(string: "Hello, world")
printWithoutCounting(string: "Hello, world")

/*:
 > Return values can be ignored, but a function that says it will return a value must always do so. A fucntion with a defined return type cannot allow control to fall out of the bottom of the function without return a value and attempting to do so will result in a compile-time error.
 
 ### Functions with Multiple Return Values
 You can use a tuple as the return type for a function to return multiple values as part of one compount return value
 */
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
//: Because the tuple's member values are named as part of the function's return type, they can be accessed with dot syntax to retrieve the minimum and maximum found values
let bounds = minMax(array: [8, -6, 2, 109, 3, 71])
print("min is \(bounds.min) and max is \(bounds.max)")

/*: 
 ### Optional Tuple Return Types
 If the tuple type to be returned from a function has the potential to have "no value" for the entire tuple, you can use an _optional_ tuple return type to reflect the fact that the entire tuple can be `nil`.
 
 > An optional tuple type such as `(Int, Int)?` is different form a tuple that contains optional types such as `(Int?, Int?)`. With an optional tuple type, the entire tuple is optional, not just each individual value within the tuple.
 */
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
//: You can use optional binding to check whether this version of the `minMaxOptional(_:)` function returns an actual tuple value or `nil`
if let boundsOptional = minMaxOptional(array: [8, -6, 2, 109, 3, 71]) {
    print("min is \(boundsOptional.min) and max is \(boundsOptional.max)")
}
//: Move on to [Function Parameter Names](@next)
