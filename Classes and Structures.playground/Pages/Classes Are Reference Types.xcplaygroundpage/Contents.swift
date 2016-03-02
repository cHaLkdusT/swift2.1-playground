//: Previous [Structures and Enumerations Are Value Types](@previous)
struct Resolution {
    var width = 0
    var height = 0
}
class VideoMode {
    var resolution = Resolution()
    var interalced = false
    var frameRate = 0.0
    var name: String?
}
let hd = Resolution(width: 1920, height: 1080)
//: ## Classes Are Reference Types
//: Unlike value types, _reference types_ are _not_ copied when they are assigned to a variable or constant, or when they are passed to a function. Rather than a copy, a reference to the same existing instance is used instead
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interalced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
/*: 
Because classes are reference types, `tenEighty` and `alsoTenEighty` actually both refer to the _same_ `VideoMode` instance. Effectively, they are just difference names for the same single instance.
Note that `tenEighty` and `alsoTenEighty` are declared as _constants_, rather than variables. However, you can still change `tenEighty.frameRate` and `alsoTenEighty.frameRate` because the values of `tenEighty` and `alsoTenEighty` constants themselves do not actually change.
*/
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")
//: ## Identity Operators
/*:
Because classes are reference types, it is possible for multiple constants and variables to refer to the same single instance of a class behind the scenes
It can sometimes be useful to find out if two constants or variables refer to exactly the same instance of a class. To enable this, Swift provides two identity operators:
* Identical to (`===`)
* Not identical to (`!==`)
*/
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}
//: WHen you define your own custom classes and structures, it is your responsibility to decide what qualifies as two instances being "equal". The process of defining your own implementations of the "equal to" and "not equal to" operators is described in Equivalence Operators
//: ## Pointers
//: If you have experience with C, C++ or Objective-C, you may know that these languages use _pointers_ to refer to addresses in memory. A Swift constant or variable that refers to an instance of some reference type is similar to a pointer in C, but is not a direct pointer to an address in memory, and does not require you to write an asterisk (`*`) to indicate that you are creating a reference. Instead, these references are defined like any other constant or variable in Swift.
//: Move on to [Choosing Between Classes and Structures](@next)
