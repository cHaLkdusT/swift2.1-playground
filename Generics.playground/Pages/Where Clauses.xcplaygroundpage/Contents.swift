//: [Previous](@previous)
protocol Container {
    associatedtype ItemType
    mutating func append(item: ItemType)
    var count: Int { get }
    subscript(i: Int) -> ItemType { get }
}
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
extension Array: Container {}
//: ## Where Clauses
/*:
 Type constraints, as described in Type Constraints, enable you to define requirements on the type parameters associated with a generic function or type.
 
 It can also be useful to define requirements for associated types. You do this by defining _where clauses_ as part ofa type parameter list. A where clause enables you to requrie that an associated type must conform to a certain protocol, or that certain type parameters and associated types must be the same. You write a where clause by placing the `where` keyword immediately after the list of type parameters, followed by constraints for associated types or equality relationships between types and associated types.
 
 The example below defines a generic function called `allItemsMatch`, which checks to see if two `Container` instances contain the same items in the same order. The function returns a Boolean value of `true` if all items match and a value of `false` if they do not.
 
 The two containers to be checked do not have to the same type of container (although they can be), but they do have to hold the same types of items. This requirement is expressed through a combination of type constraints and where clauses:
 */
func allItemsMatch<C1: Container, C2: Container where C1.ItemType == C2.ItemType, C1.ItemType: Equatable>(someContainer: C1, _ anotherContainer: C2) -> Bool {
    // check that both container containt the same number of items
    if someContainer.count != anotherContainer.count {
        return false
    }
    // check each pair of items to see if thay are equivalent
    for i in 0..<someContainer.count {
        if someContainer[i] != anotherContainer[i] {
            return false
        }
    }
    // all items are match, so return true
    return true
}
/*:
 This function takes two argumetns called `someContainer` and `anotherContainer`. The `someContainer` argument is of type `C1`, and the `anotherContainer` argument is of type `C2`. Both `C1` and `C2` are type parameters for two container types to be determined when the function is called.
 
 The function's type parameter list places the following requiremetns on the two tpe parameters:
 * `C1` must conform to the `Container` protocol (written as `C1: Container`)
 * `C2` must also conform to the `Container` protocol (written as `C2: Container`)
 * The `ItemType` for `C1` must be the same as the `ItemType` for `C2` (written as `C1.ItemType == C2.ItemType`)
 * The `ItemType` for `C1` must conform to the `Equatable` protocol (written as `C1.ItemType: Equatable`)
 
 The third and for requiremetns are defined as part of a where clause, and are written after the `where` keyword as part of the function's type parameter list:
 
 These requiremetns mean:
 * `someContainer` is a container of type `C1`
 * `anotherContainer` is a container of type `C2`
 * `someContainer` and `anotherContainer` contain the same type of items
 * The items in `someContainer` can be checked with the not equal opeartor (`!=`) to see if they are different from each other.
 
 The third and fourth requirements combine to mean that the items in `anotherContainer` can _also_ be checked with the `!=` operator, because they are exactly the same type as the items in `someContainer`.
 
 These requirement enable the `allItemsMatch(_:_:)` function to compare the two containers, even if they are of a different container type.
 
 The `allItemsMatch(_:_:)` function starts by checking that both container containt the same number of itesm. If they contain a different number of items, there is no way that they can match, and the function returns false.
 
 After making this check, the functioni iterates over all of the items in `someContainer` with a `for-in` loop and the half-open range operator (`..<`). For each item, the function checks whether the item from `someContainer` is not equal to the corresponding item in `anotherContainer`. If the two items are not equal, then the two containers do not match, and the function returns `false`.
 
 If the loop finishes withough finding a mismatch, the two containers match, adn the function return `true`.
 
 Here's how the `allItemsMatch(_:_:)` function looks in action:
 */
var stackOfString = Stack<String>()
stackOfString.append("uno")
stackOfString.append("dos")
stackOfString.append("tres")
var arrayOfStrings = ["uno", "dos", "tres"]
if allItemsMatch(stackOfString, arrayOfStrings) {
    print("All items match.")
} else {
    print("Not all items match.")
}
//: The example above creates a `Stack` instance to store `String` values, and pushes three strings onto the stack. The example also creates an `Array` instance initialized with an array literal containing the same three strings as the stack. Even though the stack and the array are of different type, they both conform to the `Container` protocol, and both contain the same type of values. You can therefore call the `allItemsMatch(_:_:)` function with theses two containers as its argumetns. In the example above, the `allItemsMatch(_:_:)` function correctly reports that all of the items in the two containers match.