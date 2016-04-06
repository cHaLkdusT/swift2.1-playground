//: Previous [Unowned References](@previous)
//: Unowned References and Implicitly Unwrapped Optional Properties
/*:
The examples for weak and unowned references above cover two of the more common scenarios in which it is necessary to break a strong reference cycle.

The `Person` and the `Aparment` example shows a situation where two properties, both of which are allowed to be `nil`, have the potential to cause a strong reference cycle. This scenario is best resolved with weak reference.

The `Customer` and `CreditCard` examples shows a situation where one property that is allowed to be `nil` and another property that cannot be `nil` have the potential to cause a strong reference cycle. This scenario is best resolved with an unowned reference.

However, there is a third scenario, in which _both_ properties should always have a value, and neither property should ever be `nil` once intialization is complete. In this scenario, it is useful to combine an unowned property on one class with an implicitly unwrappped optional property on the other class.

This enables both properties to be accessed directly (without optional unwrapping) once initialization is complete, while still avoiding a reference cycle.

The example below defines two classes, `Country` and `City`, each of which stores an instance of the other class as a property. In this data model, every country must always have a capital city and every city must always belong to a country. To represent this, the `Country` class has a `capitalCity` property and the `City` has a `country` property
*/
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        print("Country \(name) is being deinitialized")
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) is being deinitialized")
    }
}
/*:
To set up the interdependency between the two classes, the initializer for `City` takes a `Country` instance, and stores this instance in its `country` property.

The initializer for `City` is called from within initializer for `Country`. However, the initializer for `Country` cannot pass `self` to the `City` initializer until a new `Country` instance is fully initialized, as described in Two-Phase initialization.

To cope with this requirement, you declare the `capitalCity` property of `Country` as an implicitly unwrapped optional property, indicated by the exclamation mark at the end of its type annotation (`City!`). This means that the capitalCity property has a defaul value of `nil`, like any other optional, but can be accessed without the need to unwrap its value as described in Implicitly Unwrapped Optionals.

Because `capitalCity` has a default value of `nil`, a new `Country` instnce is considered fully initialized as soon as the `Country` instance sets its `name` property within its initializer. This means that the `Country` initializer can start to reference and pass around the implicity `self` property as soon as the `name` property is set. The `Country` initializer can therefore pass `self` as one of the parameters for the `City` initializer when the `Country` initializer is setting its own `capitalCity` property.

All of this means that you can create the `Country` and `City` instances in a single statement, without creating a strong reference cycle and the `capitalCity` property can be accessed directly, without needing to use an exclamation mark to unwrap its optional value
*/
var country: Country? = Country(name: "Canada", capitalName: "Ottawa")
print("\(country!.name)'s capital city is \(country!.capitalCity.name)")
// In the example above, the use of an implicitly unwrapped optional means that all of the two-pahase initializer requirements are satisfied. The `capitalCity` property can be used and accessed like a nonoptional value once intialization is complete, while still avoiding a strong reference cycle.
country = nil
//: Move on to [Strong Reference Cycles for Closures](@next)
