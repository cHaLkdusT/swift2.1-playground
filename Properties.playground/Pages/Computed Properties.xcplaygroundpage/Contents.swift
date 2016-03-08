//: Previous [Properties](@previous)
//: ## Computed Properties
//: In addition to stored properties, classes, structures and enumerations can defined _computed properties_, which do not actually store a value. Instead, they provide getter and an optional setter to retrieve and set other properties indirectly
struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set(newCenter) {
            origin.x = newCenter.x - (size.width / 2)
            origin.y = newCenter.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")
/*:
* `Point` encapsulates an `(x, y)` coordinate
* `Size` encapsulates a `width` and a `height`
* `Rect` defines a rectangle by an origin point and a size.
![Computed Properties](computedProperties_2x.png "Computed Properties")
*/
//: ### Shorthand Setter Declaration
// If a computed property's setter does not define a name for the new value to be set, a default name of newValue is used
struct AternativeRect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
//: ### Read-Only Computed Properties
/*: 
A computed property with a getter but no setter is known as a _read-only computed propert_. A read-only computed property always returns a value, and can be accessed through dot syntax, but cannot be set to a different value.
You must declare computed properties - including read-only computed properties - as variable properties with `var` keyword, because their value is not fixed. The `let` keyword is only used for constant properties, to indicate their values cannot be changed once they are set as part of instance initialization.
*/
struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
let fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("The volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
//: Move on to [Property Observers](@next)
