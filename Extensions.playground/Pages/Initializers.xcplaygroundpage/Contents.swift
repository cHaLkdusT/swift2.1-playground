//: Previous [Computed Properties](@previous)
/*:
 ## Initializers
 Extensions can add new initializers to existing types. This enables you to extend other types to accept your own custom type as initializer parameters, or to provide additional initialization options that were not included as part of the type's original implementation.
 
 Extensions can add new convenience initializers to a class, but they cannot add new designated initializers or deinitializers to a class. Designated initializers and deinitializers must always be provided by the original class implementation.
 
 NOTE: If you use an extension to add an initializer to a value type that provides default values for all of its stored properties and does not define any custom initializers, you can call the default initializer and memberwise initializer for that value type from within your extension's initializer.
 
 This would not be the case if you had written the initializer as part of the value type's original implementation, as described in Initializer Delegetaion for Value Types.
 
 The example below defines a custom `Rect` structure to represent a geometric rectangle. The example also defines two supporting structures called `Size` and `Point`, both of which provide default values of `0.0` for all of their properties
 */
struct Size {
    var width = 0.0, height = 0.0
}
struct Point {
    var x = 0.0, y = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
}
//: Because the `Rect` structure provides a default values for all of its properties, it receives a default initializer and a memberwise initializer automatically, as describe in `Default Initializers`. These initializers can be used to create new `Rect` instances
let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))
//: You can extend the `Rect` structure to provide an additional initializer that takes a specific center point and size
extension Rect {
    init(center: Point, size: Size) {
        let originX = center.x - (size.width / 2)
        let originY = center.y - (size.height / 2)
        self.init(origin: Point(x: originX, y: originY), size: size)
    }
}
//: This new initializer starts by calculating an appropriate origin point based on the provided `center` point and `size` valuee. The initializer then calls the structure's automatic memberwise initializer `init(origin:size:)`, which stores the new origin and size values in the appropriate properties
let centerRect = Rect(center: Point(x: 4.0, y: 4.0), size: Size(width: 3.0, height: 3.0))
/*:
 If you provide a new intializer with an extension, you are still responsible for making sure that each instance is fully initialized once the initializer completes.
 
Move on to [Methods](@next)
 */
