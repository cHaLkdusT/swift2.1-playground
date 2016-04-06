//: Previous [Automatic Reference Counting](@previous)
//: ## ARC in Action
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
/*:
The `Person` class has an initializer that sets the instance's `name` property and prints a message to indicate that initialization is underway. The `Person` class also has a deinitializer that prints a message when an instance of the class is deallocated

The next code snippet defines three variables of type `Person?`, which are used to set up muliple references to a new `Person` instance in subsequent code snippets. Because theses variable are of an optional type, they are automatically initialized with a value of `nil` and do not currently reference a `Person` instance.
*/
var reference1: Person?
var reference2: Person?
var reference3: Person?
//: You can now create a new `Person` instance and assignt it to one of these three variables
reference1 = Person(name: "John Appleseed")
/*:
Note that the message `"Joh Appleseed is being initialized"` is printed at the point you call the `Person` class's initializer. This confirms that initialization has taken place.

Because the `Person` instance has been assigned to the `reference1` variable, there is now a strong reference from `reference1` to the new `Person` instance. Because there is at least one strong reference, ARC makes sure that this `Person` is kept in memory nad is not deallocated.

If you assigne the same `Person` instnace to two more variables, two moe strong references to that instance are established:
*/
reference2 = reference1
reference3 = reference1
//: There are now _three_ strong references to this single `Person` instance. If you break two of these strong references (including the original reference) by assigning `nil` to two of the variables, a single strong reference remains, and the `Person` instance is not deallocated:
reference1 = nil
reference2 = nil
//: ARC does not deallocate the `Person` instance until the third and final strong refernce is broken, at which point it is clear that you are no longer using the `Person` instance:
reference3 = nil
//: Move on to [Strong Reference Cycles Between Class Instances](@next)
