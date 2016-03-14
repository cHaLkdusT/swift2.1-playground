//: Previous [Methods](@previous)
//: ## The self Property
/*:
Every instnace of a type has an implicit property called self, which is exactly equivalent to the instance itself. You use the `self` property to refer the current instance within its own instance method.
The `increment()` method in the example above could have been written like this:
*/
class Counter3 {
    var count: Int = 0
    func increment() {
        self.count += 1
    }
}
/*:
In practice, you don't need to write `self` in your code very often. If you don't explicitly write `self`, Swift assumes that you are referring to a property or method name within a method. This assumption is demonstrated by the use of `count` (rather than `self.count`) inside three instance methods for `Counter`.
The main exception to this rule occurs when a parameter name for an instance method has the same name as a property of that instance. In this situation, the parameter name takes precedence and it becomes necessary to refer to the property in a more qualified way. You use the `self` property to distinguish between the parameter name and the property name.
*/
struct Point {
    var x = 0.0, y = 0.0
    func isToTheRightOfX(x: Double) -> Bool {
        return self.x > x
    }
}
let somePoint = Point(x: 4.0, y: 5.0)
if somePoint.isToTheRightOfX(1.0) {
    print("This point is to the right of the line where x == 1.0")
}
//: Without the `self` prefix, Swift would assume that both uses of `x` referred to the method parameter called `x`
//: ### Modifying Value Types from Within Instance Methods
/*:
Structures and enumerations are _value types_. By default, the properties of a value type cannot be modified from within its instance methods.
However, if you need to modify the properties of your structure or enumeration within particular method, you can opt in to _mutating_ behavior for that method. The method can then mutate (that is, change) its properties from within the method, and any changes that it makes are written back to the original strucuture when the method ends. the method can also assign a completely new instnace to its implicit `self` property, and this new instance will replace the existing one when the method ends.
You can opt in to this behavior by placing the `mutating` keyword before the `func` keyword for that method:
*/
struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
var somePoint2 = Point2(x: 1.0, y: 1.0)
somePoint2.moveByX(2.0, deltaY: 3.0)
print("The point is now at (\(somePoint2.x), \(somePoint2.y))")
// You cannot call a mutating method on a constant of structure type, because its properties cannot be changed, even if they are variable properties
let fixPoint = Point2(x: 3.0, y: 3.0)
// fixPoint.moveByX(2.0, deltaY: 3.0)
// ### Assigning to self Within a Mutating Method
//: Mutating methods can assign an entirely new instance to the implicit `self` property.
struct Point3 {
    var x = 0.0, y = 0.0
    mutating func moveByX(deltaX: Double, deltaY: Double) {
        self = Point3(x: deltaX, y: deltaY)
    }
}
/*: 
This version of the mutating `moveByX(_:y:)` method creates a brand new structure whose `x` and `y` are set to the target location. The end result of calling this alternative version of the method will be exactly the same as for calling the earlier version.
Mutating methods for enumeratinos can set the implicity `self` parameter to be a different case from the same enumeration
*/
enum TriStateSwitch {
    case Off, Low, High
    mutating func next() {
        switch self {
        case .Off:
            self = Low
        case .Low:
            self = High
        case .High:
            self = Off
        }
    }
}
var ovenLight = TriStateSwitch.Low
ovenLight.next()
ovenLight.next()
//: This example defines an enmeration for a three-state switch. The switch cycles between three different power states (`Off`, `Low` and `High`) every time its `next()` method is called
//: Move on to [Type Methods](@next)
