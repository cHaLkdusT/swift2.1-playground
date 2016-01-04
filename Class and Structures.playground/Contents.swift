/// CLASSES AND STRUCTURES
/// COMPARING CLASSES AND STRUCTURES
/// DEFINITION SYNTAX
class SomeClass {
    // class definition goes here
}
struct SomeStructure {
    // structure definition goes here
}

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

/// CLASS AND STRUCTURE INSTANCES
let someResolution = Resolution()
let someVideoMode = VideoMode()

/// ACCESSING PROPERTIES
print("The width of someResolution is \(someResolution.width)")
print("The width of someVideoMode is \(someVideoMode.resolution.width)")
someVideoMode.resolution.width = 1280
print("The width of someVideoMode is now \(someVideoMode.resolution.width)")

/// MEMBERWISE INITIALIZERS FOR STRUCTURE TYPES
let vga = Resolution(width: 640, height: 480)

/// STRUCTURES AND ENUMERATIONS ARE VALUE TYPES
let hd = Resolution(width: 1920, height: 1080)
var cinema = hd
cinema.width = 2040
print("cinema is now \(cinema.width) pixels wide")
print("hd is still \(hd.width) pixels wide")

enum CompassPoint {
    case North, South, East, West
}
var currentDirection = CompassPoint.West
let rememberedDicrection = currentDirection
currentDirection = .East
if rememberedDicrection == .West {
    print("The remembered is still .West")
}

/// CLASSES ARE REFERENCE TYPES
let tenEighty = VideoMode()
tenEighty.resolution = hd
tenEighty.interalced = true
tenEighty.name = "1080i"
tenEighty.frameRate = 25.0
let alsoTenEighty = tenEighty
alsoTenEighty.frameRate = 30.0
print("The frameRate property of tenEighty is now \(tenEighty.frameRate)")

/// IDENTITY OPERATORS
if tenEighty === alsoTenEighty {
    print("tenEighty and alsoTenEighty refer to the same VideoMode instance.")
}

/// POINTERS
// *

/// CHOOSING BETWEEN CLASSES AND STRUCTURES
// The structure's primary purpose is to encapsulate a few relatively simple data values
// It is reasonable to expect that the encapsulated values wil be copied rather than referenced when yo assign or pass around an instance of that structure
// ANy properties stored by the structure are themselves value types, whoich would also be expected to be copied rather than referenced
// The structure does not need to inherit porperties or behavior from another existing type

/// ASSIGNEMNT AND COPY BEHVAIOR FOR STRINGS, ARRAYS AND DICTIONARIES
// Swift's String, Array and Dictionary types are implement as structures
