//: Previous [Boolean](@previous)
//: # Tuples
//: _Tuples_ group multiple values into a single compound value. The values with a tuple can be of any type and do not have to be of the same type as each other
let http404error = (404, "Not Found") // describes an HTTP status code
//: You can _decompose_ a tuple's contents into separate constants or variables, which you then access as usual
let (statusCode, statusMessage) = http404error
print("The status code is \(statusCode)")
print("The status message is \(statusMessage)")
//: If you only need some of the tuple's values, ignore parts of the tuple with an underscore (_) when you decompose the tuple
let (justStatusCode, _) = http404error
justStatusCode
//: Access the individual element values in a tuple using index numbers starting zero
print("The status code is \(http404error.0)")
print("The status message is \(http404error.1)")
//: You can name the individual elements in a tuple when the tuple is defined
let http200status = (code: 200, message: "OK")
http200status.code
http200status.message
/*:
Tuples are particulary useful as the return values of functions. A function that tries to retrieve a web page might return the `(Int, String)` tuple type to describe the success or failure of the page retrieval.

Tuples are useful for temporary groups of related values. They are not suited to the creation of complex data structures. If your data structure is likely to persist beyond a temporary scope, model it as a class or structure, rather than as a tuple.

Move on to [Optionals](@next)
*/
