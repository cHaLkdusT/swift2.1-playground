//: Previous[Initializers](@previous)
//: Methods
//: Extensions can add new instance methods and type methods to existing types. The following example adds a new instance method called `repititions` to the `Int` type:
extension Int {
    func repititions(task: () -> Void) {
        for _ in 0..<self {
            task()
        }
    }
}
/*: 
 The `repititions(_:)` method takes a single argument of type `() -> Void`, which indicates a function that has no parameters and does not return a value.
 
 After defining this extension, you can call the `repitions(_:)` method on any integer number to perform a task that many number of times:
 */
3.repititions({
    print("Hello!")
})
//: Use trailing closure syntax to make the call more succinct:
4.repititions {
    print("Goodbye!")
}
//: ### Mutating Instance Methods
/*:
 Instance methods added with an extension can also modify (or _mutate) the instance itself. Structure and enumerations methods that modify `self` or its properties must mark the instance method as `mutating`, just like mutating methods from an original implementation.
 
 The example below adds a new mutating method called `square` to Swift's `Int` type, which sqaures the original value:
 */
extension Int {
    mutating func square() {
        self = self * self
    }
}
var someInt = 3
someInt.square()
//: Move on to [Subscripts](@next)
