//: Previous [Naming Type Parameters](@previous)
//: ## Generic Types
/*:
 In addition to generic functions, Swift enables you to define you own _generic types_. These are custom classes, structures and enumeration that can work with _any_ type, in a similar way to `Array` and `Dictionary`.
 
 This section shows you how to write a generic collection type called `Stack`. A stack is an ordered set of values, similar to an array, but with a more restricted set of operations than Swift's `Array` type. An array allows new items to be inserted and removed at any location in the array. A stack, however, allows new items to be appended only to the end of the collection (known as _pushing_ a new value on to the stack). Similarly, a stack allows items to be removed only from the end of the collection (known as _popping_ a value off the stack).
 
 NOTE: The concept of a stack is used by the `UINavigationController` class to model the view controllers in its navigation hierarchy. You call the `UINavigationController` class `pushViewController(_:animated:) method to add (or push) a view controller on to the navigation stack, and its `popViewControllerAnimated(_:)` method to remove (or pop) a view controller from the navigation stack. A stack is a useful collection model whenever you need a strict "last in, first out" approach to managing a collection.
 
 The illustration belo shows the push / pop behavior for a stack:
 ![Stack Push Pop](stackPushPop_2x.png "Stack Push Pop")
 
 1. There are currently three values on the stack
 2. A fourth value is "pushed" on to the top of the stack
 3. The stack now holds four values, with the most recent once at the top
 4. The top item in the stack is removed, or "popped"
 5. After popping a value, the stack once again holds three values.
 
 Here's how to write a non-generic version of a stack, in this case for a stack of `Int` values:
 */
struct IntStack {
    var items = [Int]()
    mutating func push(item: Int) {
        items.append(item)
    }
    mutating func pop() -> Int {
        return items.removeLast()
    }
}
/*:
 This structure uses an `Array` property called `items` to store the values in the stack. `Stack` provides two methdos, `push` and `pop`, to push and pop values on and off the stack. These methdos are marked as `mutating`, because they need to modify (or _mutate_) the structure's `items` array.
 
 The `IntStack` type shown above can only be used with `Int` values, however. It would be much more useful to define a _generic_ `Stack` class, that can manage a stack of _any_ type of value.
 
 Here's a generic version of the same code:
 */

struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
/*:
 Note how the generic version of `Stack` is essentially the same as the non-generic version, but with a type parameter called `Element` instead of a an actual type of `Int`. This type parameter is written within a pair of angle brackets (`<Element>`) immediately after the structure's name.
 
 `Element` defines a placeholder name for "some type `Element`" to be provided later on. This future type can be referred to as "`Element`" anywhere within the structure's definition. In this case, `Element` is used as a placeholder in three places:
 
 * To create property called `items`, which initialized with an empty array of values of type `Element`
 * To specify that the `push(_:)` method has a single parameter called `item`, which must be of type `Element`
 * To specify that the value returned by the `pop()` method will be a value of type `Element`
 
 Because it is a generic type, `Stack` can be used to create a stack of _any_ valid type in Swift, in a similar manner to `Array` and `Dictionary`.
 
 You create a new `Stack` instance by writing the type to be stored in the stack within angle brackets. For example, to create a new stack of strings, you write `Stack<String>()`:
 */
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
/*: 
 Here's how `stackOfString` looks after pushing these four values on to the stack: 
 ![Stack Pushed Four Strings](stackPushedFourStrings_2x.png "Stack Pushed Four Strings")
 
 Poping a value from the stack returns and removes the top value, `"cuatro"`
 */
let fromTheTop = stackOfStrings.pop()
/*:
 Here's how the stack looks after popping its top value:
 ![Stack Popped One Strings](stackPoppedOneString_2x.png "Stack Popped One Strings")
 */
//: Move on to [Exending a Generic Type](@next)
