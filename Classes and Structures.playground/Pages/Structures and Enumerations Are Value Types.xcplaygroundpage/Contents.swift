//: Previous [Classes and Structures](@previous)
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
/*:
 ## Structures and Enumerations Are Value Tyeps
 A _value type_ is a type whose value is _copied_ when it is assigned to a variable or constant, or when it is passed to a function.
 
 All of the basic types in Swift - integers, floating-point numbers, Booleans, strings, arrays and dictionaries - are value types, and are implemented as structures behind the scenes
 
 All structures and enumerations are value types in Swift. This means that any structure and enumeration instances you create - and any value types they have as properties - are always copied when they are passed around in your code.
*/
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
/*: 
 This example declares a constant called `hd` and sets it to a `Resolution` instance initialized with the width and height of full HD video (1920 x 1080)
 
 It then declares a variable called `cinema` and sets it to the current value of `hd`. Because `Resolution` is a structure, a _copy_ of the existing instance is made, and this new copy is assigend to `cinema`. Even though `hd` and `cinema` now have the same width and height, they are two completely different instances behind the scenes.
*/
cinema.width = 2040
//: Checking the `width` property of `cinema` shows that it has indeed changed to be `2048`
print("cinema is now \(cinema.width) pixels wide")
//: However, the `width` property of the original `hd` instance still has the old value of `1920`
print("hd is still \(hd.width) pixels wide")
//: The same behavior applies to enumerations:
enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDicrection = currentDirection
currentDirection = .East
if rememberedDicrection == .West {
    print("The remembered is still .West")
}
//: Move on to [Classes Are Reference Types](@next)
