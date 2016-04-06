//: Previous [Resolving Strong Reference Cycles Between Class Instances](@previous)
//: ### Unowned References
/*:
Like weak references, an _unowned reference_ does not keep a strong hold on the instance it refers to. Unlike a weak references, however, an unowned reference is assume to _always_ have a value. Because of this, an unowned reference is always defined as a nonoptional type. You indicted an unowned reference by placing the `unowned` keyword before a property or variable declaration.

Because an unowned reference is nonoptional, you don't need to unwrap the unowned reference each time it is used. An unowned reference can always be accessed directly. However, ARC cannot set the reference to `nil` when the instance it refers to is deallocated, because variables of a nonoptional type cannot be set to `nil`.

If you try to access an unowned reference after the instance that it references is deallocated, you will trigger a runtime error. Use unowned references only when you are sure that the reference will _always_ refer to an instance.

Not also that Swift guarantees your app will crash if you try to access an unowned reference after the instance it references is deallocated. You will never encounter unexpected behavior in this situation. Your app will always crash reliably, although you should, of course, prevent it from doing so.

The following example defines two classes, `Customer` and `CreditCard`, which model a bank customer and a possible credit card for that customer. These two classes each store an instance of the other class as a property. This relationship has the potential to create a strong reference cycle.

The relationship between `Customer` and `CreditCard` is slightly different from the relationship between `Apartment` and `Person` seen in the weak reference example above. In this data model, a customer may or may not have a credit card, but a credit card will _always_ be associated with a customer. To represent this, the `Customer` class has an optional `card` property, but the `CreditCard` class has a nonoptional `customer` property.

Furthermore, a new `CreditCard` instance can _only_ be created by passing a `number` value and a `customer` instance to a custom `CreditCard` initializer. This ensures that a `CreditCard` instance always has a `customer` instance associated with it when the `CreditCard` instance is created.

Because a credit card will always have a customer, you define its `customer` property as an unowned reference, to avoid a strong reference cycle.
*/
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
/*:
The `number` property of the `CreditCard` class is defined with the type of `UInt64` rather than `Int`, to ensure that the `number` property's capacity is larged enough to store a 16-digit card number on both 32-bit and 64-bit systems.

The next code snippet defines an optional `Customer` variable called `tyler`, which will be used to store a reference to a specific customer. This variable has an initial value of `nil`, by the virtue of being optional
*/
var john: Customer?
//: You can now create a `Customer instance and use it to initialize and assign new `CreditCard` instance as that customer's `card` property
john = Customer(name: "John Appleseed")
john!.card = CreditCard(number: 1234_5678_9012_3456, customer: john!)
/*:
Here's how the references look, now that you've linked the two instances:
![Unowned Reference 1](unownedReference01_2x.png "Unowned Reference 1")

The `Customer` instance now has a strong reference to the `CreditCard` instance, and `CreditCard` instance has an unowned reference to the `Customer` instance.

Because of the unowned `customer` reference, when you break the strong reference held by `john` variable, there are no more strong references to the `Customer` instance
![Unowned Reference 2](unownedReference02_2x.png "Unowned Reference 2")

Because there are no more strong references to the `Customer` instance, it is deallocated. After this happens, there are no more strong references to the `CreditCard` instance, and it too is deallocated
*/
john = nil
/*:
The final code snippet above shows that the deinitializers for the `Customer` instance and the `CreditCard` instance both print their "deinitialized" messages after the `john` variable is set to `nil`

Move on to [Unowned References and Implicitly Unwrapped Optional Properties](@next)
*/
