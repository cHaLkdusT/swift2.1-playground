//: Previous [Generic Types](@previous)
struct Stack<Element> {
    var items = [Element]()
    mutating func push(item: Element) {
        items.append(item)
    }
    mutating func pop() -> Element {
        return items.removeLast()
    }
}
var stackOfStrings = Stack<String>()
stackOfStrings.push("uno")
stackOfStrings.push("dos")
stackOfStrings.push("tres")
stackOfStrings.push("cuatro")
//: ## Extending a Generic Type
/*:
 When you extend a generic type, you do not provide a type parameter list as part of the extension's definition. Instead, the type parameter list from the _original_ type definition is available within the body of the extension, and the original type parameter names are used to refer to the type parameters from the original definition.
 
 The following example extends the generic `Stack` type to add a read-only property call `topItem`, which returns the top item on the stack without popping it from the stack:
 */
extension Stack {
    var topItem: Element? {
        return items.isEmpty ? nil : items[items.count - 1]
    }
}
/*:
 the `topItem` property returns an optional type `Element`. If the stack is empty, `topItem` returns 'nil'; if the stack is not empty, `topItem` returns the final item in the `items` array.
 
 Note that this extension does not define a type parameter list. Instead, the `Stack` type's existing type parameter name, `Element`, is used within the extension to indicate the optional type of the `topItem` computed property.
 
 The `topItem` computed property can now be used with any `Stack` instance to acces and query its top item without removing it.
 */
if let topItem = stackOfStrings.topItem {
    print("The top item on the stack is \(topItem)")
}
//: Move on to [Type Constraints](@next)
