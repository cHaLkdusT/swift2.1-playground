/// INHERITANCE
/// DEFINING A BASE CLASS
class Vehicle {
    var currentSpeed = 0.0
    var description: String {
        return "traveling at \(currentSpeed) miles per hour"
    }
    func makeNoise() {
        // do nothing - an arbitrary vehicle doesn't necessarily make a noise
    }
}
let someVehicle = Vehicle()
print("Vehicle: \(someVehicle.description)")

/// SUBCLASSING
class Bicycle: Vehicle {
    var hasBasket = false
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Tandem: Bicycle {
    var currentNumberOfPassengers = 0
}
let tandem = Tandem()
tandem.hasBasket = true
tandem.currentNumberOfPassengers = 2
tandem.currentSpeed = 22.0
print("Tandem: \(tandem.description)")

/// OVERRIDING
/// ACCESSING SUPERCLASS METHODS, PROPERTIES AND SUBSCRIPTS
// super.someMethod()
// super.someProperty
// super[someIndex]

/// OVERRIDING METHODS
class Train: Vehicle {
    override func makeNoise() {
        print("Choo choo")
    }
}
let train = Train()
train.makeNoise()

/// OVERRIDING PROPERTIES

/// OVERRIDING PROPERTY GETTERS AND SETTERS
class Car: Vehicle {
    var gear = 1
    override var description: String {
        return super.description + " in gear \(gear)"
    }
}
let car = Car()
car.currentSpeed = 25.0
car.gear = 3
print("Car: \(car.description)")

/// OVERRIDING PROPERTY OBSERVERS
class AutomaticCar: Car {
    override var currentSpeed: Double {
        didSet {
            gear = Int(currentSpeed / 10) + 1
        }
    }
}
let automatic = AutomaticCar()
automatic.currentSpeed = 35.0
print("AutomaticCar: \(automatic.description)")

/// PREVENTING OVERRIDES
// final