//: # Optional Chaining
/*:
 _Optional chaining_ is a process for querying and calling properties, methods, and subscripts on an optional that might currently be `nil`. If the optional contains a value, the property, method, or subscript call succeeds; if the optional is `nil`, the property, method, or subscript call returns `nil`. Multiple queries can be chained together, and the entire chain fails gracefully if any link in the chain is `nil`.
 
 Optional chaining in Swift is similar to messaging `nil` in Objective-C, but in a way that works for any type, and that can be checked for success or failure.
 
 ## Optional Chaining as an Alternative to Forced Unwrapping
 You specify optional chaining by placing a question mark (`?`) after the optional value on which you wish to call a property, method or subscript if the optional is non-`nil`. This is very similar to placing an exclamation mark (`!`) after an optional value to force the unwrapping of its value. The main difference is that optional chaining fails gracefully when the optional is `nil`, whereas forced unwrapping triggers a runtime error when the optional is `nil`.
 
 To reflect the fact that optional chaining can be called on a `nil` value, the result of an optional chaining is always an optional value, even if the property, method, or subscript you are querying returns a nonoptional value. You can use this optional return value to check whether the optional chaining call was successful (the returned optional contains a value), or did not succeed due to a `nil` value in the chain (the returned optiona value is `nil`)
 
 Specifically, the result of an optional chaining call is of the same type as the expected return value, but wrapped in an optional. A property that normally returns an `Int` will return an `Int?` when accessed through optional chaining.
 */
class Person {
    var residence: Residence?
}
class Residence {
    var numberOfRooms = 1
}
/*:
 `Residence` instances have a single `Int` property called `numberOfRooms`, with a default value of `1`. `Person` instances have an optional `residence` property of type `Residence?`
 
 If you create a new `Person instance, its `residence` property is defaul initialized to `nil`, by the virtue of being optional.
 */
let john = Person() // has a `residence` property value of `nil`
//: If you try to access the `numberOfRooms` property of this person's `residence`, by placing an exclamation mark after `residence` to for the unwrapping of its value, you trigger a runtime error, because there is no `residence` value to unwrap:
//let roomCount = john.residence!.numberOfRooms
/*:
 The code above succeeds when `john.residence` has a non-`nil` value and will set `roomCount` to an `Int` value containing the appropriate number of rooms. However, this code always triggers a runtime error when `residence` is `nil`.
 
 Optioinal chaining provides an alternative way to access the value of `numberOfRooms`. To use optional chaining, use a question mark in place of the exclamation mark:
 */
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
/*:
 This tells Swift to "chain" on the optional `residence` property and to retrieve the value of `numberOfRooms` if `residence` exists.
 
 Because the attempt to access `numberOfRooms` has the potential to fail, the optional chaining attempt returns a value of type `Int?` or "optional `Int`". When the `residence` is `nil`, as in the example above, this optional `Int` will also be `nil`, to reflect the fact that it was not possible to access `numberOfRooms`. The optional `Int` is accessed through optional binding to unwrap the integer and assign the nonoptional value to the `roomCount` variable.
 
 Not that this is true even though `numberOfRooms` is a nonoptional `Int`. The fact that it is queried through an optional chain means that the call to `numberOfRooms` will always return an `Int?` instead of an `Int`.
 
 You assign a `Residence` instance to `john.residence`, so that it no longer has a `nil` value:
 */
john.residence = Residence()
//: `john.residence` now contains an actual `Residence` instance, rather than `nil`. If you try to access `numberOfRooms` with the same optional chaining as before, it will now return an `Int?` that contains the default `numberOfRooms` value of `1`:
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
//: Move on to [Defining Model Classes for Optional Chaining](@next)
