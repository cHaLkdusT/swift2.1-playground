//: Previous [Inheritance](@previous)
class Vehicle {
    var currentSpeed = 0.0
    // Static computed property but is overridable
    /*class*/ var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
/*:
 ## Overriding
 A subclass cna provide its own implementation of an instance method, type method, instance property, type property or subscript that it would otherwise inherit from a superclass. This is known as _overriding_.
 
 To override a characteristics that would other be inherited, you prefix definition with the `override` keyword. Doing so clarifies that you intent to provide an override and have not provided a matching definition by mistake. Overriding by accident can cause unexpected behavior, and nay overrides without the `override` keyword are diagnosed as an error when your code is compiled.
 
 The `override` keyword also prompts the Swift compiler to check that your overriding class's superclass has a declaration that matches the one you provided for the override. Thic check ensures that your overriding definition is correct.

 ### Accessing Superclass Methods, Properties and Subscripts
 When you provide a method, property or subscript override for a subsclass, it is sometimes useful to use the existing superclass implementation as part of your override. For example, you can refine the behavior of that existing implementation, or store a modified value in an existing inherited variable.
*/
// super.someMethod()
// super.someProperty
// super[someIndex]
//: ### Overriding Methods
//: You can override an inherited instance or type method to provide a tailored or alternative implementation of the method within your subclass.
class Train: Vehicle {
    override func makeNoise() {
        print("Choo choo")
    }
}
//: If you create a new instance of `Train` and call its `makeNoise()` method, you can see that the `Train` subclass version of the method is called.
let train = Train()
train.makeNoise()

//: ### Overriding Properties
//: You can override an inherited instance or type property to provide your own custom getter and setter for that property, or to add property observers to enable the overriding property to observe when the underlying property value changes
class Truck: Vehicle {
    override var currentSpeed: Double  {
        willSet {
            print("Override property and listen to changes. New value of \(self) is \(newValue)")
        }
    }
}
let truck = Truck()
truck.currentSpeed = 20.0

/*:
 ### Overriding Property Getters and Setters
 You can provide a custom getter (and setter, if appropriate) to override _any_ inherited property, regardless of wheter the inherited property is implement as stored or computed property at source. The stored or computed property is not known by a subclass - it only knows that the inherited property has a certain name and type. You must always state both the name and the type of the property you are overriding, to enable the compiler to check that your override matches a superclass property with the same name and type.
 
 You can present an inherited read-only property as read-write property by providing both a getter and setter in your subclass property override. You cannot, however, present an inherited read-write property as read-only property
 
 > If you provide a setter as part of a property override, you must also provide a getter for that override. If you don't want to modify the inherited property's value within the overriding getter, you can simply pass through the inherited value by returning `super.someProperty` from the getter, where `someProperty` is the name of the property you are overriding.
*/
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
/*:
 The override of the `description` property starts by calling `super.description`, which returns the `Vehicle` class's `description` property. The `Car` class's version of `description` then adds some extra text onto the end of this description to provide information about the current gear.
 
 If you create an instance of the `Car` class and set its `gear` and `currentSpeed` properties, you can see that its `description` property returns the tailored description defined within the `Car` class
*/
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")
/*:
 ### Overriding Property Observers
 You can use property overriding to add property observers to an inherited property. This enables you to be notified when the value of an inherited property changes, regardless of how that property was originally implemented.
 
 > You cannot add property observers to inherited constant stored properties or inherited read-only computed properties. The value of theses properties cannot be set, and so it is not appropriate to provide a `willSet` or `didSet` implementation as part of an override.
 
 > Note also that you cannot provide an overriding setter and an overriding property observer for the same property. If yuo want to observe a property's value, and you are already providing a custom setter for that property, you can simple observe any value changes form within the custom setter.
*/
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}
//: Whenever you set the `currentSpeed` property of an `AutomaticCar` instance, the property's `didSet` observer sets the instance's `gear` property to an appropriate choice of gear for the new speed. Specifically, the property observer chooses a gear that is the new `currentSpeed` value divided by `10` rounded down to nearest integer, pluse `1`.
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")
//: Move on to [Preventing Overrides](@next)
