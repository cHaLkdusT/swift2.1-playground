//: Previous [Strong Reference Cycles Between Class Instances](@previous)
//: ## Resolving Strong Reference Cycles Between Class Instances
/*:
Swift provides two ways to resolve strong reference cycles when you work with properties of class type: weak references and unowned references.

Weak and unowned references enable one instance in a reference cycle to refer to the other instance _without_ keeping a strong hold on it. The instances can then refer to each other without creating a strong reference cycle.

Use a weak reference whenever it is valid for that reference to become `nil` at some point during its lifetime. Conversely, use an unowned reference when you know that the reference will never be `nil` once it has been set during initialization.
*/
//: ### Weak References
/*:
A _weak reference_ is a reference that does not keep a strong hold on the instance it refers to, and so does not stop ARC from disposing of the reference instance. This behavior prevents the reference from becoming part of a strong reference cycle. You indicate a weak reference by placing a `weak` keyword before a property or variable declaration.

Use a weak reference to avoid reference cycles whenever it is possible for that reference to have "no value" at some point in its life. If the reference will _always_ have a value, use an unowned reference instead. In the `Aparment` example, it is appropriate for an apartment to be able to have "no tenant" at some point in its lifetime, and so a weak reference is an appropriate way to break the reference cycle in this case.

Weak references must be declared as variables, to indicaet that their value can change at runtime. A weak reference cannot be declared as constant.

Because weak references are allowed to have "no value", you must declary every weak reference as having an optional type. Optional types are the preferred way to represent the possibility for "no value" in Swift.

Because a weak reference does not keep a strong hold on the instance it referes to, it is possible for that instance to be deallocated while the weak reference is still referring to it. Therefor, ARC automatically sets a weak reference to `nil` when the instance that it refers to is deallocated. You can check for the existence of a value in the weak reference, just like any other optional value, and you will never end up with a reference to an invalid instance that no longer exists.
*/
class Person {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment?
    deinit {
        print("\(name) is being deinitialized")
    }
}

class Apartment {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
//: The strong references from the two variables (`john` and `unit4a` and the links between the two references are created
var john2: Person?
var unit4a2: Apartment?

john2 = Person(name: "John Appleseed")
unit4a2 = Apartment(unit: "4A2")

john2!.apartment = unit4a2
unit4a2!.tenant = john2
/*:
Here's how the reference look now that you've linked the two instances together:
![Weak Reference 1](weakReference01_2x.png "Weak Reference 1")
The `Person` instance still has a strong reference to the `Apartment` instance, but the `Apartment` instance now has a _weak_ reference to the `Person` instance. This means that when you break the strong reference held by the `john` variable, there are no more strong references to the `Person` instance:
![Weak Reference 2](weakReference02_2x.png "Weak Reference 2")

Because there are no more strong references to the `Person` instance, it is deallocated
*/
john2 = nil
/*:
The only remaining strong reference to the `Apartment` instance is from the `unit4a` variable. If you break _that_ strong reference, there are no more strong references to the `Apartment` instance:
![Weak Reference 3](weakReference03_2x.png "Weak Reference 3")
*/
unit4a2 = nil
/*:
The final two code snippets above show that the deinitializers for the `Person` instance and the `Apartment` instance print their "deinitialized" messages after the `john` and `unit4a` variables are set to `nil`. This proves that the reference cycle has been broken.

In systems that use garbage collection, weak pointers are sometimes used to implement a simple caching mechanism because objects with no strong references are deallocated only when the memory pressure triggers garbage collection. However, with ARC, values are deallocated as soon as their last strong reference is removed, making weak references unsuitable for such a purpose.
*/
//: Move on to [Unowned References](@next)
