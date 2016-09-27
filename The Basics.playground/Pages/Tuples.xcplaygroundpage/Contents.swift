//: Previous [Boolean](@previous)
//: ## Tuples
//: _Tuples_ groupd multiple values into a single compound value. The values with a tuple can be of any type and do not have to be of the same type as each other
let http404Error = (404, "Not Found") // describes an HTTP status code
//: You can _decompose_ a tuple's contents into separate constants or variables, which you then access as usual
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The satatus message is \(statusMessage)")
//: If you only need some of the tuple's values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
//: Access the individual element values in a tuple using index numbers starting zero
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")
//: You can name the individual elements in a tuple when the tuple is defined
let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")
/*: 
Tuples are particulary useful as the return values of functions. A function that tries to retrieve a web page might return the `(Int, String)` tuple type to describe the success or failure of the page retrieval.
Move on to [Optionals](@next)
*/
