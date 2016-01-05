//: Previous [Tuples](@previous)
//: # Optional
//: You use _optionals_ in situations where a value mau be absent.
/*:
* There _is_ a value, and it equals _x_
* There _isn't_ a value at all
*/
/*: 
The concept of optionals doesn't exist in C or Objective-C. The nearest thing in Objective-C is the ability to return `nil` from a method that would otherwise return an object, with nil meaning" the absence of a valide object". However, this only works for objects - it doesn't work for structures, basic C types, or enumeration values. 9

Here's an example of how optionals can be used to cope with the absence of a value. Swift's `Int` type has an initializer which tries to convert a String value into an `Int` value. However, not every string can be converted into an integer. The string "123" can be converted into the number value of `123`, the the string "hello, world" does not have an obvious numeric value to convert to.
*/

//: ## nil
//: You set an optional variable to a valueless state by assigning it to the value value `nil`

//: If you define an optinoal variable without providing a default value, the variable is automatically set to `nil` for you

//: Swift's nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. Int Swift, nil is not a pointer - it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types
//: ## If Statements and Forced Unwrapping
//: You can use an `if` statement to find out whether an optional contains a value by comparing the optional against `nil`.

//: Once you're sure that the optional _does_ contain a value, you can access its underlying value by adding an exclamation mark (!) to the end of the optional's name.

//: ## Optional Binding
//: You use _optional binding_ to find out whether an optional contains a value, and if so, to make that value avaiable as a temporary constant or variable.

//: You can include multiple optional bindings in a single if and use a `where` clause to check for a Boolean condition

//: ## Implicit Unwrapped Optionals
//: Sometimes it is clear from a program's structure that an optional will _always_ have a value, after that value is first set. Int these cases, it is useful to remove the need to check and unwrap the optional's value every time it is accessed, because it can be safely assumed to have a value all of the time.

//: You can still treat an implicitly unwrapped optional like a normal optional

//: Move on to [Error Handling](@next)
