// # Methods
/*:
_Methods_ are functions that are associated with a particular type. Classes, structures and enumerations can all define instance methods, which encapsulate specific tasks and functionality for working with an instance of a given type. Classes, structres and enumerations can also define type methods, which are associated with the type itself. Type methods are similar to class methods in Objective-C.
The fact that structures and enumerations can define methods in Swift is a major difference from C and Objective-C. In Objective-C, classes are the only types that can define methods. In Swift, you can choose whether to define a class, structure or enumeration and still have the flexibility to define methods on the type you create
*/
//: ## Instance Methods
/*:
_Instance methods_ are functions taht belong to instances of a particular class, structure, or enumeration. They support the functionality of those instances, either by providing ways to access and modify instance properties, or by providing functionality related to the instance's purpose. Instance methods have exactly the same syntax as functions.
You write an instance method within the opening and closing braces of the type it belongs to. An instance method has implicit access to all other instance methods and properties of that type. An instance method can be called only on a specific instance of the type it belongs to. It cannot be called in isolation without an existing instance
*/
class Counter {
    var count = 0
    func increment() {
        count += 1
    }
    func incrementBy(amount: Int) {
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
counter.incrementBy(5)
counter.count
counter.reset()
counter.count
//: ## Local and External Parameter Names for Method
/*:
Function parameters can have both a local name (for use within the function's body) and an external name (for use when calling the function). The same is true for method parameters because methosd are just functions that are associated with a type.
Methods in Swift are very similar to their counterparts in Objective-C. As in Objective-C, the name of a method in Swift typically refers to the method's first parameter using a preposition such as `with`, `for`, or `by` as seen in `incrementBy(_:)` method form the preceding `Counter` class example. The use of preposition enables the method to be read as a sentence when it is called.
Swift gives the _first_ parameter name in a method a local parameter name by default, and gives the second and subsequent parameter names both local _and_ external names by default. Thi convention matches the typical naming and calling convention you will be familiar with from writing Objective-C methods, and makes for expressive method calls without the need to qualify your parameter names
*/
class Counter2 {
    var count: Int = 0
    func incrementBy(amount: Int, numberOfTimes: Int) {
        count += amount * numberOfTimes
    }
}
//: The `incrementBy(_:numberOfTimes:)` methods has two parameters -- `amount` and `numberOfTimes`. By default, Swfit treats `amount` as a local name only, but treats `numberOfTimes` as both local _and_ an external name.
let counter2 = Counter2()
counter2.incrementBy(5, numberOfTimes: 3)
counter2.count
/*: 
You don't need to define an external parameter name for the first argument value, because its purpose is clear from the function name. The second argument, however, is qualified by an external parameter name to make its purpose clear when the method is called.
The behavio described above means that method definitions in Swift are written with the same grammatical style as Objective-C and are called in a natural, expressive way.
*/
//: ## Modifying External Parameter Name Behavior for Methods
/*:
Sometims it's useful to provide an external parameter name for a method's first parameter, even though this is not the default behavior. To do so, you can add an explicity external name yourself.
Conversely, if you do not want to provide an external name for the second or subsequent parameter of a method, override the default behavior by using an underscore character (`_`) as an explicit external parameter for that parameter
*/
//: Move on to [The self Property](@next)