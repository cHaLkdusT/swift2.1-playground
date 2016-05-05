//: Preivous [Extending a Generic Type](@previous)
//: ## Type Constraints
/*:
 The `swapTwoValues(_:_:)` function and the `Stack` type can work with any type. However, it is sometimes useful to enforce certain _type constraints_ on the types that can be used with generic functions and generic types. Type constraints specify that a type parameter must inherit from a specific class, or conform to a particular protocol or protocol composition.
 
 For example, Swift's `Dictionary` type places a limitation on the types that can be used as keys for a dictionary. As described in Dictionaries, the type of a dictionary's keys must be _hashable_. That is, it must provide a way to make itself uniquely representable. `Dictionary` needs its keys to be hashable so that it can check whether it already contains a value for a particular key. Without this requirement, `Dictionary` could not tell whether it should insert or replace a value for a particular key, nor would it be able to find a value for a given key that is already in the dictionary.
 
 This requirement is enforced by a type constraint on the key type for `Dictionary` which specifies that the key type must conform to the `Hashable` protocol, a special protocol defined in the Swift standard library. All of the Swift's basic types (such as `String`, `Int`, `Double` and `Bool`) are hashable by default.
 
 You can defined your own type constraints when craeteing custom generic types, and these constraints provide much of the power of generic programming. Abstract concepts like `Hashable` characterize types in terms of their conceptual characteristics, rather than their explicit type.
 */
//: ### Type Constraint Syntax
//: You write type constraints by placing a single class or protocol constraint after a type parameter's name, separated by a colon, as part of the type parameter list. The basic syntax for type constraints on a generic function is shown below (although the syntax is the same for generic types):
//func someFunction<T: SomeClass, U: SomeProtocol>(someT: T, someU: U) {
//    // function body goes here
//}
//: The hypothetical function above has two types parameters. The first type parameter, `T`, has a type constraint that requires `T` to be a subclass of `SomeClass`. The second type parameter, `U`, has a type constraint that requires `U` to conform to the protocol.
//: ### Types Constraints in Action
//: Here's a non-generic function called `findStringIndex`, which is given a `String` value to find an array of `String` values within which to find it. The `findStringIndex(_:_:)` function returns an optional `Int` value, which will be the index of the first matching string in the array if it is found, or `nil` if the string cannot be found:
func findStringIndex(array: [String], _ valueToFind: String) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
//: The `findStringIndex(_:_:)` function can b used to find a string value in an array of strings:
let strings = ["cat", "dog", "llama", "parakeet", "terrapin"]
if let foundIndex = findStringIndex(strings, "llama") {
    print("The index of llama is \(foundIndex)")
}
/*:
 the principle of finding the index of a value in an array isn't useful only for strings, however. You can write the same funcitonality as a generic function called `findIndex`, by replacing any mention of strings with values of some type `T` instead.
 
 Here's how you might expect a generic version of `findSTringIndex`, called `findIndex`, to be written. Note that the return type of this function is still `Int?` because the function returns an optional index number, not an optional value from the array. Be warned, though - this function does not compile, for reasons explained after the example:
 */
//func findIndex<T>(array: [T], _ valueToFind: T) -> Int? {
//    for (index, value) in array.enumerate() {
//        if value == valueToFind {
//            return index
//        }
//    }
//    return nil
//}
/*:
 This function does not compile as written above. The problem lies with the equality check, "`if value == valueToFind`". Not every type in Swift can be compared with the equal to operator (`==`). If you create your own class or structure to represent a complex data model, for example, then the meaning of "equal to" for that class or structure is not something that Swift can guess for you. Because of this, it is not possible to guarantee that this code will work for _every_ possible type `T`, and an appropriate error is reported when you try to compile the code.
 
 All is not lost, however. The Swift standard library defines a protocol called `Equatable`, which requries any conforming type to implement the equal to operator (`==`) and the not equal to operator (`!=`) to compare any two values of that type. All of Swift's standard type automatically support the `Equatable` protocol.
 
 Any type that is `Equatable` can be used safely with the `findIndex(_:_:)` function, because it is guaranteed to support the equal to operator. To express this fact, you write a type constraint of `Equatable` as part of the type parameter's definition when you define the function:
 */
func findIndex<T: Equatable>(array: [T], _ valueToFind: T) -> Int? {
    for (index, value) in array.enumerate() {
        if value == valueToFind {
            return index
        }
    }
    return nil
}
/*:
 The single type parameter for `findIndex` is written as `T: Equatable`, which means that "any type `T` that conforms to the `Equatable` protocol."
 
 The `findIndex(_:_:)` function now compiles successfully and can be used with any type that is `Equatable, such as `Double`, or `String`:
 */
let doubleIndex = findIndex([3.14159, 0.1, 0.25], 9.3)
let stringIndex = findIndex(["Mike", "Malcolm", "Andrea"], "Andrea")
//: Move on to [Associated Types](@next)
