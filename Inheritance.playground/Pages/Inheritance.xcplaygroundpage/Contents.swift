//: # Inheritance
/*:
 A class can _inherit_ methods, properties and other characteristics from another class. when one class inherits from another, the inheriting class is known as a _subclass_ and the class it inherits from is known as its _superclass_. Inheritance is a fundamental behavior that differentiates classes from other types in Swift.
 
 Classes in Swift can call and access methods, properties and subscripts belonging to their superclass and can provide their own overriding versions of those methods, properties and subscripts to refine or modify their behavior. Swift helps to ensure your overrides are correct by checking that the override definition has a matching superclass definition.
 
 Classes can also add property observers to inherited properties in order to be notified when the value of a property changes. Property observers can be added to any property, regardless of wheter it was originally defined as a stored or computed property.
*/
//: ## Defining a Base Class
/*:
 Any class that does not inherit from another class is known as a _base class_.
 
 > Swift classes do not inherit from universal base class. Classes you define without specifying a super autonmatically become base classes for you to build upon.
*/
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
//: You create a new instance of `Vehicle` with _initialer syntax_, which is written as a `TypeName` followed by empty parenthesis:
let someVehicle = Vehicle()

//: Having created a new `Vehicle` instance, you can access its `description` property to print human-readable description of the vehicle's current speed.
print("Vehicle: \(someVehicle.description)")

//: The `Vehicle` class defines common characteristics for an arbitrary vehicle, but is not much use in itself. To make it more useful, you need to refine it to describe more specific kinds of vehicle.

/*:
 ## Subclassing
 _Subclassing_ is the act of basing a new class on an existing class. The subclass inherits characteristics from the existing class, which you can then refine. You can also add new characteristics to the subclass.
 
 To indicate that a subclass has a superclass, write the subclass name before the superclass name, separated by colon.
 
 The following example defines a subclass called `Bicycle`, with a superclass of `Vehicle`:
*/
class Bicycle: Vehicle {
    var hasBasket = false
}
/*:
 The new `Bicycle` class automatically gains all of the characteristics of `Vehicle` such as its `currentSpeed` and `description` properties and its `makeNoise()` method.
 
 In addition to the characteristics it inherits, the `Bicycle` class defines a new stored property, `hasBasket`, with a default value of `false`
 
 By default, any new `Bicycle` instance you create will not have a basket. You can set the `hasBasket` property to true for particular `Bicycle` instance after that instance is created:
*/
let bicycle = Bicycle()
bicycle.hasBasket = true
//: You can also modify the inherited `currentSpeed` property of `Bicycle` instance, and query the instance's inherited `description` property:
bicycle.currentSpeed = 15.0
print("Bicycle: \(bicycle.description)")

//: Subclasses can themselves be subclassed. The next example creates a subclass of `Bicycle` for a two-seater bicycle known as "tandem"
class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}

//: `Tandem` inherits all of the properties and methods from `Bicycle`, which in turns inherits all of the properties and methods from `Vehicle`. The `Tandem` subclass also adds new stored property called `currentNumberOfPassengers`, with default value of `0`
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")
//: Move on to [Overriding](@next)
