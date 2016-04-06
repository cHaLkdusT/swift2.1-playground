//: Previous [ARC in Action](@previous)
//: ## Strong Reference Cycles Between Class Instances
/*:
In the examples above, ARC is able to track thenumber of instances to the new `Person` instance you create and to deallocate that `Person` instance when it is no longer needed.

However, it is possible to write code in which an instance of a class _never_ gets to a point where it has zero strong references. This can happen if two class instances hold a strong reference to each other, such that each instance keeps the other alive. This is known as _strong reference cycle_.

You resolve strong reference cycle by defining some of the relationships between classes as weak or unowned references instead of as strong references. However, before you learn how to resolve a strong reference cycle, it is useful to understand how such a cycle is caused.

Here's an example of how a strong reference cycle can be created by accident. This example defines two classes called `Person` and `Apartment`, which model a block of apartments and its residents:
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
    var tenant: Person?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
/*:
Every `Person` instance has a `name` property of type `String` and an optional `apartment` property that is initially `nil`. The `apartment` property is optional, because a person may not always have an apartment.

Similarly, every `Aparment` instance has a `unit` property of type `String` and has an optional `tenant` property that is initially `nil`. The tenant property is optional because an apartment may not always have a tenant.

Both of these classes also define a deinitializer, which prints the fact that an instance of that class is being deinitialized. This enables you see whenter instance of `Person` and `Apartment` are being deallocated as expected.

This code snippet defines two variable of optional type called `john` and `unit4a`, which will be set to a specific `Apartment` and `Person` instance below. Both of these variables have an initial value of `nil` by virtue of being optinoal:
*/
var john: Person?
var unit4a: Apartment?
//: You can now create a specific `Person` instance and `Apartment` instance and assign these new instances to the `john` and `unit4a` variables:
john = Person(name: "John Appleseed")
unit4a = Apartment(unit: "4A")
/*: Here's how the strong references look after creating and assigning these two instances. The `john` variable now has a strong reference to the new `Person` instance and the `unit4a` variable has a strong reference to the new `Aparment` instance
![Refence Cycle 1](referenceCycle01_2x.png "Refence Cycle 1")
You can now link the two instnace together so that the person has an apartment and the apartment has a tenant. Note that an exclamation mark (`!`) is used to unwrap and access the instances stored inside the `john` and `unit4a` optional variables, so that the properties of those instances can be set:
*/
john!.apartment = unit4a
unit4a!.tenant = john
/*: Here's how the strong reference looks after you link the two instances together:
![Refence Cycle 2](referenceCycle02_2x.png "Refence Cycle 2")
Unfortunately, linking these two instances creates a strong reference cycle between them. The `Person` instance now has a strong reference to the `Apartment` instance, and `Aparment` instance has a strong reference to the `Person` instance. Therefore, when you break the strong refernces held by the `john` and `unit4a` variables, the reference counts do not droop to zero, and the instances are not deallocated by ARC:
*/
john = nil
unit4a = nil
/*:
Note that neither deinitializer was called when you set these two variables to `nil`. The strong reference cycle prevents the `Person` and `Aparment` instances from ever being deallocated, causing a memory leak in your app.

Here's how the strong reference look after you set the `john` and `unit4a` to `nil`:

![Refence Cycle 3](referenceCycle03_2x.png "Refence Cycle 3")

The strong references between the `Person` instance and the `Apartment` instance remain and cannot be broken
*/
//: Move on to [Resolving Strong Reference Cycles Between Class Instances](@next)
