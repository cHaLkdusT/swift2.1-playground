//: Previous [Type Constraints](@previous)
//: ## Associated Types
//: When defining a protocol, it is sometimes useful to declare one or more associated types as part of the protocol's definition. An _associate type_ gives a placeholder name to a type that is used as part of the protocol. The actual type to use for that associated type is not specified until the protocol is adopted. Associated types are specified with the `associatedtype` keyword.
//: ### Associated Types in Action
//: Here's an example of a protocol called `Container`, which declares an assocated type called `ItemType`:
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
/*:
 The `Container` protocol defines three required capabilities that any container must provide:
 * It must be possible to add a new item to the container with an `append(_:)` method.
 * It must be possible to access a count of the items in the container through a `count` property that returns an `Int` value.
 * It must be possible to retrieve each item in the container with a subscript that takes an `Int` index value.
 
 This protocol doesn't specify how the items in the container should be stored or what type they are allowed to be. The protocol only specifies the three bits of functionality that any type must provide in order to be considered a `Container`. A conforming type can provide additional functionality, as long as it satisfies these three requirements.
 
 Any type that conforms to the `Container` protocol must be able to specify the type of values it stores. Specifically, it must ensure that only items of the right type are added to the container, and it must be clear about the type of the items returned by its subscript.
 
 To define these requirements, the `Container` protocol needs a way to refer to the type of the elements that a container will hold, without knowing what type is for a specific container. The `Container` protocol needs to specify that any value passed to the `append(_:)` method must have the same type as the container's element type, and that the value returned by the container's subscript will be of the same type as the container's element type.
 
 To achieve this, the `Container` protocol declares an associated type called `ItemType`, written as `associated ItemType`. The protocol does not defined what `ItemType` is - that information is left for any conforming type to provide. Nonetheless, the `ItemType` alias provides a way to refer to the type of the items in a `Container`, and to define a type for use with the `append(_:)` method and subscript, to ensure that the expected behavior of any `Container` is enforced.
 
 Here's the version of non-generic `IntStack` from earlier, adapted to conform to the `Container` protocol:
 */
struct IntStack: Container {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int? {
        return items.removeLast()
    }
    // conformance to the Container Protocol
    typealias ItemType = Int
    mutating func append(item: ItemType) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Int {
        return items[i]
    }
}
/*:
 The `IntStack` type implements all three of the `Container protocol's requiremetns, and in each case wraps part of the `IntStack` type's existing functionality to satisfy these requirements.
 
 Moreover, `IntStack` specifies that for this implementation of `Container`, the appropriate `ItemType` to use is of type `Int`. The definition of `typealias ItemType = Int` turns the abstract type of `ItemType` into a concrete type of `Int` for this implementation of the `Container` protocol.
 
 Thanks to Swift's type inference, you don't actually need to declare a concrete `ItemType` of `Int` as part of the definition of `IntStack`. Because `IntStack` conforms to all of the requiremetns of the `Container` protocol, Swift can infer the appropriate `ItemType` to use, simply by looking at the type of the `append(_:)` method's `item` parameter and return the type of the subscript. Indeed, if you delete the `typealias ItemType = Int` line from the code above, everything still works, because it is clear what type should be used for `ItemType`.
 
 You can also make the generic `Stack` type conform to the `Container` protocol:
 */
struct Stack<Element>: Container {
    // original Stack<Element> implementation
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
    // conformance to the Container Protocol
    mutating func append(item: Element) {
        self.push(item)
    }
    var count: Int {
        return items.count
    }
    subscript(i: Int) -> Element {
        return items[i]
    }
}
//: This time, the type parameter `Element` is used as the type of the `append(_:)` method's `item` parameter and the return type of the subscript. Swift can therefore infer that `Element` is the appropriate type to use as the `ItemType` for this particular container.
//: Extending an Existing Type to Specify an Associated Type
/*:
 You can extend an existing type to add conformance to a procotol, as described in Adding Protocol Conformance wiht an Extension. This includes a protocol with an associated type.
 
 Swift's `Array` type already provides an `append(_:)` method, a `count` property, and a subscript with an `Int` index to retrieve its elements. These three capabilities match the requirements of the `Container` protocol. This means that you can extend `Array` to conform to the `Container` protocol simply by declaring that `Array` adopts the protocol. You do this with an emtpy extension as described in Declaring Protocol Adoption with an Extension:
 */
extension Array: Container {}
/*:
 Array's existing `append(_:)` method and subscript enable Swift to infer the appropriate type to use for the `ItemType`, just as for the generic `Stack` type above. After defining this extenion, you can use an `Array` as a `Container`.
 */
//: Move on to [Where Clauses](@next)
