//: Previous [Default Initializers](@previous)
//: ## Initializer Delegation for Value Types
/*:
Initializers can call other initializers to perform part of an instance's initialization. This process, known as _initializer delegation_, avoids duplicating code acroos multiple initializers.
The rules for how initializer delegation works, and for what forms of delegation are allowed, are different for value types and class types. Value types (structures and enumerations) do not suppport inheritance and so their initializer delegation process is relatively simple, because they can only delegate to another initializer that they provide themselves. Classes, however, can inherit from other classes described in Inheritance. This means that classes have additional responsibilities for ensuring that all stored properties they inherit are assigned a suitable value during initialization. 
For value types, you use `self.init` to refer to other initializers from the same value type when writing your own custom initializers. You can call `self.init` only from within an initializer.
Note that if you define a custom initializer for a value type, you will no longer have access to the default initializer (or the memberwise initializer, if it is a structure) for that type. This constraint prevents a situation in which additional essential setup provided in a more complext initializer is accidentally circumvented by someone using one of the automatic initializers.
If you want your custom value type to be initialize with the default initializer and memberwise initializer, and also with your own custom initializers, write your custom initializers in an extension rather than as part of the value type's originial implementation.

*/
/**
 Represents a geometric rectangle. Requires two supporting structures called `Size` and `Point`, both of which provide default values of `0.0` for all of their properties.
*/
struct Size {
    var width = 0.0, height = 0.0
}

struct Point {
    var x = 0.0, y = 0.0
}
/*: 
You can initialize `Rect` structure below in one of three ways-
* by using its default zero-initialized `origin` and `size` property values
* by providing a specific origin point and size
* by providing a speific center point and size
These initialization options are represented by three custom initializers that are part of the `Rect` structure's definition:
*/
struct Rect {
    var origin = Point()
    var size = Size()
    init() {}
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//: The first `Rect` initializer, `init()`, is functionally the same as the default initializer that the structure would have recieved if it did not have its own custom initializer
let basicRect =  Rect()
//: The second `Rect` initializer, `init(origin:size:)`, is functionally the same as the memberwise initializer that the structure would hae recieved if did not have its own custom initializer.
let originRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//: The third `Rect` initializer, `init(center:size:)`, is slightly more complex. It starts by calculating an appropriate origin point based on a `center` point and a `size` value. It then calls (or _delegates) to the `init(origin:size)` initializer, which stores the new origin and size values in the appropriate properties
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
//: The `init(center:size)` initializer could have assigned the new values of `origin` and `size` to the appropriate properties itself. However, it is more convenient (and clearer in intent) for the `init(center:size)` initializer to take advantage of an existing initializer that already provides exactly that functionality.
//: Move on to [Class Inheritance and Initalization](@next)
