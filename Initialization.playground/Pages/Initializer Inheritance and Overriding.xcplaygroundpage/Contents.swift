//: Previous [Class Inheritances and Initialization](@previous)
//: ## Initializer Inheritance and Overriding
/*:
Unlike subclasses in Objective-C, Swift subclasses do not inherit their superclass initializers by default. Swift's approach prevents a situation in which a simple initialiazer from a superclass is inherited by a more specialized subclass and is used to create a new instance of the subclass that is not fully or correctly initialized.

If you want a custom subclass to presetn one or more of the same intiializers as its superclass, you can provide a custom implementation of those initializers within the subclass.

When you write a subclass initializer that matches a superclass _designated_ initializer, you are effectively providing an override of that designated initializer. Therefore, you must write the `override` modifier before the subclass's initializer definition. This is true even if you are overriding an automaticllay provided default initializer.

Conversely, if you write a subclass initializer that matches a superclass _convenience_ initializer, that superclass convenience initializer can never be called directly by your subclass. Therefore, your subclass is not providing an override of the superclass initializer. As a result, you do not write `override` modifer when providing a matching implementation of superclass convenience initializer.
*/
class Vehicle {
    var numberOfWheels = 0
    var description: String {
        return "\(numberOfWheels) wheel(s)"
    }
}
//: The default initializer is always a designated initializer for a class, and can be used to create a new `Vehicle` instancw with a `numberOfWheels` of `0`
let vehicle = Vehicle()
print("Vehicle: \(vehicle.description)")
//: Defines a subclass of `Vehicle`
class Bicycle: Vehicle {
    override init() {
        super.init()
        numberOfWheels = 2
    }
}
let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")
//: ### Automatic Initializer Inheritance
/*:
As mentioned above, subclasses do not inherit their superclass initializers by default. However, superclass initializers _are_ automatically inherited if certain conditions are met. In practice, this means that you do not need to write initializers overrides in many common scenarios and can inherit your superclass initializers with minimal effort whenever it is safe to do so.

Assuming that you provide default values for any new properties you introduce in a subclass, the following two rules apply:
* Rule 1. If your subclass doesn't define any designated initializers, it automatically inherits all of its superclass designated initializers
* Rules 2. If your subclass provides an implementation of _all_ of its superclass designated initializers - either by inheriting them as per rule 1 or by providing a custom implementation as part of its definition - then it automatically inherits all of the superclass convenience initializers.
*/
//: ### Designated and Convenience Initializers in Action
//: The following example shows designated initializers, convenience initialziers and automatic initializer inheritance in action.
class Food {
    var name: String
    init(name: String) {
        self.name = name
    }
    convenience init() {
        self.init(name: "[Unnamed]")
    }
}
/*: The figure below shows the initializer chain for the `Food` class
![Initializers Example 1](initializersExample01_2x.png "Initializers Example 1")
Classes do not have a default memberwise initializer, and so the `Food` class provides a designated initializer that takes a single argument called `name`. This iniitlaizer can be used to create a new `Food` instance with a specific name
*/
let namedMeat = Food(name: "Bacon")
let mysteryMeat = Food()
//: The second class in the hierarchy is a subclass of `Food` called `RecipeIngredient`. The `RecipeIngredient` class modesl an ingredient in a cooking recipe. It introduces an `Int` property called `quantity` and defines two initializers for creating `RecepiIngredient`
class RecipeIngredient: Food {
    var quantity: Int
    init(name: String, quantity: Int) {
        self.quantity = quantity
        super.init(name: name)
    }
    override convenience init(name: String) {
        self.init(name: name, quantity: 1)
    }
}
/*: ![Initializers Example 2](initializersExample02_2x.png "Initializers Example 2")
The `RecipeIngredient` class has a single designated initializer, `init(name: String, quantity: Int)`, which can be used to populate all of the properties of a new `RecipeIngredient` instance. This initializer starts by assigning the passed `quantity` argument to the `quantity` property introduced by `RecipeIngredient`. After doing so, the initializer delegates up to the `init(name: String)` initializer of the `Food` class. This process satisfies the safety check 1 from Two-Phase Initialization.

`RecipeIngredient` also defines a convenience initializer, `init(name: String)` which is used to create a `RecipeIngredient` instance by name alone. This convenience initializer assumes a quantity of `1` for any `RecipeIngredient` instance that is created without any explicit quantity. The definition of this convenience initializer makes the `RecipeIngredient` instances quicker and more convenient to create, and avoid code duplication when creating several single-quantity `RecipeIngredient` instances. This convenience initializer simply delegates across to the class's designated initializer, passing in a `quantity` value of `1`.

The `init(name: String)` convenience initializer provided by `RecipeIngredient` takes the same parameters as the `init(name: String)` _designated_ initializer from `Food`. Because this convenience initializer overrides a designated initializer from its superclass, it must be marked with the `override` modifier.

Even though `RecipeIngredient` provides the `init(name: String)` initializer as a convenience initializer, `RecipeIngredient` has nonetheless provided an implementation of all of its superclass's designated initialier. Therefore, `RecipeIngreditent` automatically inherits all of its superclass's convenience initializers too.

In this example, the superclass for `RecipeIngrident` is `Food`, which has a single convenience initializer called `init()`. This initializer is therefore inherited by `RecipeIngredient`. The inherited version of `init()` functions in exactly the same way as the `Food` version, except that it delegates to the `RecipeIngredient` version of `init(name: String)` rather that the `Food` version.
*/
let oneMysteryItem = RecipeIngredient()
oneMysteryItem
let oneBacon = RecipeIngredient(name: "Bacon")
let sixEggs = RecipeIngredient(name: "Eggs", quantity: 6)
//: Every item in the shopping list starts out as "unpurchased". To represent this fact, `ShoppingListItem` introduces a Boolean property called `purchased`, with a default value of `false`. `ShoppingListItem` also adds a computed `description` property which provides a textual description of a `ShoppingListItem` instance
class ShoppingListItem2: RecipeIngredient {
    var purchased = false
    var description: String {
        var output = "\(quantity) x \(name)"
        output += purchased ? " (y)" : " (n)"
        return output
    }
}
/*:
Because it provides a default value for all of the properties it introduces and does not define any initializers itself, `ShoppingListItem` automaticlaly inherits _all_ of the designated and convenience initializers from its superclass
![Initializers Example 3](initializersExample03_2x.png "Initializers Example 3")
*/
var breakfastList = [
    ShoppingListItem2(),
    ShoppingListItem2(name: "Bacon"),
    ShoppingListItem2(name: "Eggs", quantity: 6)
]
breakfastList[0].name = "Orange juice"
breakfastList[0].purchased = true
for item in breakfastList {
    print(item.description)
}
//: Move on to [Failable Initializers](@next)
