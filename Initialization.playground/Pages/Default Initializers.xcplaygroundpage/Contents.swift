//: Previous [Customizing Initialization](@previous)
//: ## Default Initializers
/*:
Swift provides a _default initializer_ for any structure or class that provides default values for all of its properties and does not provide at least one initializer itself. The default initializer simply creates a new instance with all of its properties set to their default values.
The example defines a class called `ShoppingListItem`, which encapsulates the name, quantity and purchase state of an item in a shopping list:
*/
class ShoppingListItem {
    var name: String? // Default to nil, even though this value is not written in code
    var quantity = 1
    var purchased = false
}
var item = ShoppingListItem()
//: Because all properties of the `ShoppingListItem` class have default values, and because it is a base class with no superclass, `ShoppingListItem` automatically gains a default initializer implementation that creates a new instance with all of its properties set to their default values.
//: Memberwise Initializers for Structure Types
/*:
Structure types automatically receive a _memberwise initializer_ if they do not define any of their own custom initializers. Unlike a default initializer, the structure receives a memberwise initializer even if it has stored properties that do not have default values.
The memberwise initializer is a shorthand way to initialize the member properties of new structure instances. Initial values for the properties of the new instance can be passed to the memberwise initializer by name.
*/
struct Size {
    var width = 0.0, height = 0.0
}
//: The `Size` structure automatically recieves an `init(width:height:)` memberwise initializer, which you can use to initialize a new `Size` instance
let twoByTwo = Size(width: 2.0, height: 2.0)
//: Move on to [Initializer Delegation for Value Types](@next)
