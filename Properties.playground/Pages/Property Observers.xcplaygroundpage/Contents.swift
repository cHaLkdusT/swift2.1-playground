//: Previous [Property Observers](@previous)
//: ## Property Observers
/*:
_Property Observers_ observe and respond to changes in a property's value. Property observers are called every time a property's value is set, even if the new value is the same as the property's current value.
You can add property observers to any stored properties you define, apart from lazy stored properties. You can also add property observers to any inherited property (whether stored or computed) by overriding the property within a subclass.
You have the option to define either or both of these observers on a property
* willSet is called just before the value is stored
* didSet is called immediately after the new value is stored.
The `willSet` and `didSet` observers of superclass properties are called when a property is set in a subclass initializer
*/
class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue {
                print("Added \(totalSteps - oldValue)")
            }
        }
    }
}
let stepCounter = StepCounter()
stepCounter.totalSteps = 200
stepCounter.totalSteps = 360
stepCounter.totalSteps = 896
/*:
The `StepCounter` class declares a `totalSteps` property of type `Int`. This is a stored property with `willSet` and `didSet` observers.
The `willSet` and `didSet` observers for `totalSteps are called whenever the property is assigned a new value. This is true even if the new value is the same as the current value.
*/
//: Move on to [Global and Local Variables](@next)
