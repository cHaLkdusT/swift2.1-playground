// # Methods
/*:
 _Methods_ are functions that are associated with a particular type. Classes, structures and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structres and enumerations can also define type methods, which are associated with the type itself. Type methods are similar to class methods in Objective-C.
 
 The fact that structures and enumerations can define methods in Swift is a major difference from C and Objective-C. In Objective-C, classes are the only types that can define methods. In Swift, you can choose whether to define a class, structure or enumeration and still have the flexibility to define methods on the type you create

 ## Instance Methods
 _Instance methods_ are functions taht belong to instances of a particular class, structure, or enumeration. They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance's purpose. Instance methods have exactly the same syntax as functions.
 
 You write an instance method within the opening and closing braces of the type it belongs to. An instance method has implicit access to all other instance methods and properties of that type. An instance method can be called only on a specific instance of the type it belongs to. It cannot be called in isolation without an existing instance
*/
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func increment(by amount: Int) {
        count += amount
    }
    func reset() {
        count = 0
    }
}
/*:
The `Counter` class defines three instance methods:
* `increment` increments the counter by `1`
* `increment(amount: Int)` increments the counter by a specified integer amount
* `reset` resets the counter to zero
*/
let counter = Counter()
counter.increment()
counter.count
counter.increment(by: 5)
counter.count
counter.reset()
counter.count
/*:
 Function parameters can have both a local name (for use within the function's body) and an external name (for use when calling the function). The same is true for method parameters because methods are just functions that are associated with a type.
*/

//: Move on to [The self Property](@next)
