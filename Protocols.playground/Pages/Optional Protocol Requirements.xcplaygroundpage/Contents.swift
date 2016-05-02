//: Previous [Checking for Protocol Conformance](@previous)
//: ## Optional Protocol Requirements
/*:
 You can define _optional requirements_ for protocols. These requirements do not have to be implemented by types taht conform to the protocol. Optional requirements are prefixed by the `optional` modifier as part of the protocol's definition. When you use a method or property in an optional requirement, its type automatically becomes an optional. For example, a method of type `(Int) -> String` becomes `((Int) -> String)?`. Note that the entire function type is wrapped in the optional, not the method's return value.
 
 An optional protocol requirements can be called with optional chaining, to account for the possibility that the requirement was not implemented by a type that conforms to the protocol. You check for an implementation of an optional method by writing a question mark after the name of the method when it is called, such as `someOptionalMethod?(someArgument)`. For more information on optional chaining, see Optional Chaining.
 
 NOTE: Optional protocol requirements can only be specified if your protocol is marked with the `@objc` attribute.
 
 This attribute indicates that the protocol should be expose to Objectitve-C code and is described in _Using Swift with Cocoa and Objective-C Swift 2.2)_. Even if you are not interoperating with Objective-C, you need to mark your protocols with the `@objc` attribute if you want to specify optional requiremetns.
 
 Note also that `@objc` protocols can be adopted only by classes that inherit from Objective-C classes or other `@objc` classes. They can't be adopted by structures or enumerations.
 
 The following example defines an integer-counting class called `Counter`, which uses an external data source to provide its increment amount. This data source is defeined by the `CounterDataSource` protocol, which has two optional requirements:
 */
import Foundation
@objc protocol CounterDataSource {
    optional func incrementForCount(count: Int) -> Int
    optional var fixedIncrement: Int { get }
}
/*:
 The `CounterDataSource` protocol defines an optional method requirement called `incrementForCount(_:)` and an optiona property requirement called `fixedIncrement`. These requirements define two different ways for data sources to provide an appropriate increment amount for a `Counter` instance.
 
 NOTE: Strictly speaking, you can write a custom class that conforms to `CounterDataSource` without implementing _either_ protocol requirement. They are both optional, after all. Although technically allowed, this wouldn't make for a very good data source.
 
 The `Counter` class, defined below, has an optional `dataSource` property of type `CounterDataSource?`:
 */
class Counter {
    var count = 0
    var dataSource: CounterDataSource?
    func increment() {
        if let amount = dataSource?.incrementForCount?(count) {
            count += amount
        } else if let amount = dataSource?.fixedIncrement {
            count += amount
        }
    }
}
/*:
 The `Counter` class stores its current value in a variable property called `count`. The `Counter` class also defines a method called `increment`, which increments the `count` property every time the method is called.
 
 The `increment()` method first tries to retrieve an increment amount by looking for an implementation of the `incrementForCount(_:)` method on its data source. The `increment()` method uses optional chaining to try to call `incrementForCount(_:)`, and passes the current `count` value as the method's single argument.
 
 Note the _two_ levels of optional chaining are at play here. First, it is possible that `dataSource` may be `nil`, and so `dataSource` has a question mark after its name to indicate that `incrementForCount(_:)` should be called only if `dataSource` isn't `nil`. Second, even if `dataSource` _does_ exists, there is no guarantee that it implements `incrementForCount(_:)`, because it is an optional requirement. Here, the possibility that `incrementForCount(_:)` might not be implemented is also handled by optional chaining. The call to  `incrementForCount(_:)` happens only if `incrementForCount(_:)` exists - that is, if it isn't `nil`. This is why `incrementForCount(_:)` is also written with a question mark after its name.
 
 Because the call to `incrementForCount(_:)` can fail for either of these two reasons, the call returns an _optional_ `Int` value. This is true even though `incrementForCount(_:)` is defined as returning a nonoptional `Int` value in the definition of `CounterDataSource. Even though there are two optional chaining operations, one after another, the result is still wrapped in a single optional. For more infomration about using multiple optional chaining operations, see Linking Multiple Levels of Chaining.
 
 After calling `incrementForCount(_:)`, the optional `Int` that it returns is unwrapped into a constant called `amount`, using optional binding. If the optional `Int` does contain a value - taht is, if the delegate and method both exists, and the method returned a value - the unwrapped `amount` is added onto the stored `count` property, and incrementation is complete.
 
 If it is _not_ possible to retrieve a value from `incrementForCount(_:)` method - either because `dataSource` is nil, or because the data source does not implement `incrementForCount(_:)` - then the `increment()` method tries to retrieve a value from the data source's `fixedIncrement` property instead. The `fixedIncrement` property is also an optional requirement, so its value is an optional `Int` value, even though `fixedIncrement` is defined as a nonoptional `Int` property as part of the `CounterDataSource` protocol definition.
 
 Here's a simple `CoutnerDataSource` implementation where the data source returns a constant value of `3` every time it is queried. It does this by implementing the optional `fixedIncrement` property requirement:
 */
class ThreeSource: NSObject, CounterDataSource {
    let fixedIncrement = 3
}
//: You can use an instance of `ThreeSource` as the data source for a new `Counter` instance:
var counter = Counter()
counter.dataSource = ThreeSource()
for _ in 1...4 {
    counter.increment()
    print(counter.count)
}
/*:
 The code above creates a new `Counter`instance; sets its data source to be a new `ThreeSource` instance; and calls the counter's `increment()` method four times. As expected, the counter's `count` property increases by three each time `increment()` is called.
 
 Here's a more complex data source called `TowardsZeroSource`, which makes a `Counter` instance count up or down towards zero from its current `count` value:
 */
@objc class TowardsZeroSource: NSObject, CounterDataSource {
    func incrementForCount(count: Int) -> Int {
        if count == 0 {
            return 0
        } else if count < 0 {
            return 1
        } else {
            return -1
        }
    }
}
/*:
 The `TowardsZeroSource` class implements the optional `incrementForCount(_:)` method from the `CounterDataSource` protocol and uses the `count` argument value to work out with returns `0` to indicate that no further counting should take place.
 
 You can use an instance of `TowardsZeroSource` with the existing `Counter` instance to count from `-4` to zero. Once the counter reaches zero, no more couting takes place
 */
counter.count = -4
counter.dataSource = TowardsZeroSource()
for _ in 1...5 {
    counter.increment()
    print(counter.count)
}
//: Move on to [Protocol Extensions](@next)
