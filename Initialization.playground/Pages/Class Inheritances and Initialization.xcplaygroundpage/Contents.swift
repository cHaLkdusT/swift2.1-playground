//: Previous [Initializer Delegation for Value Types](@previous)
//: ## Class Inheritance and Initialization
/*:
All of a class's stored properties - including any properties the class inherits from its superclass - _must_ be assigned an initial value during initialization.

Swift defines two kinds of initializers for class types to help ensure all stored properties receive an initial value. These are known as designated initializers and convenience initializers.
*/
//: ### Designated Initializers and Convenience Initializers
/*:
_Designated initializers_ are the primary initializers for a class. A designated initializer fully initializes all properties introduced by that class and calls an appropriate superclass initializer to continue the initalization process up to the superclass chain.

Classes tend to have very few designated initializers and it is quite common for class to have only one. Designated initializers are "funnel" points through which initialization takes place, and through which the initialization process continue up the superclass chain.

Every class must have at least one designated initializer. In some cases, this requirement is satisfied by inheriting one or more designated initializers from a superclass.

_Convenience initalizers_ are secondary, supporting initializers for a class. You can define a convenience initializer to call a designated initializer from the same class as the convenience initializer with some of the designated initializer's parameter set to default values. You can also defin a convenience initializer to create an instance of that class for a specific use or input value type.

You do not have to provide convenience initializers if your class does not require them. Create convenience initializers whenever a shortcut to a common initialization patter will save time or make initialization fo the class clearer in intent.
*/
//: ### Syntanx for Designated and Convenient Initializers
//: Designated initializers for classes are writtent in the same ways as simple initializers for value types:
//init(parameters ){
//    statements
//}
//: Convinience initializers are written in the same style, but with the `convenience` modifier place before the `init` keyword, separated by a space:
//convenience init(parameters) {
//    statements
//}
//: ### Initializer Delegation for Class Types
/*:
To simplify the relationships between designated and convenience initializers, Swfit applies the following three rules for delegation calls between initializers:

* Rule 1 A designated initializer must call a designated initializer from its immediate superclass
* Rule 2 A convenience initializer must call another initializer from the _same_ class
* Rule 3 A convenience initilizer must ultimately call a designated initializer.

A simple way to remember this is:
* Designated initializers must always delegate _up_.
* Convenience initializers must always delegate _across_.

These rules are illustrated in the figure below:
![Initializer Delegation](initializerDelegation01_2x.png "Initializer Delegation")

Here, the superclass has a single designated initializer and two convenience initializers. One convenience initializer calls another convenience initializer. This satisfeis rules 2 and 3 from above. The superclass does not itself have a further superclass, so rule 1 does not apply.

The subclass in this figure has two designated initializers and one convenience initializer. The convenience initializers must call one of the two designated initializers, because it can only call another initializer from the same class. This satisfies rules 2 and 3 form above. Both designated initializers must call the single designated initializer from the superclass, to satisty rule 1 from above.

These rules don't affect how users of your classes _create_ instances of each class. Any initializer in the diagram above can be used to create a fully-initialized instance of the class they belong to. The rules only affect how you write the implementation of the class's initializers.

The figure below shows a more complex class hierarchy for four classes. It illustrate how the designated initializers in this hierarchy act as "funnel" points for class initialization, simplifying the interrelationships among classes in the chain:
![Initializer Delegation 2](initializerDelegation02_2x.png "Initializer Delegation 2")
*/
//: ## Two-Phase Initialization
/*:
Class initialization in Swift is a two-phase process. In the first phase each store property is assigned an initial value by the class that introduced it. Once the initial state for every stored property has been determined, the second phase begins, and each class is given the opportunity to customize its store properties further before the new instance is considered ready for use.

The use of a two-phase initialization process makes initialization safe, while still giving complete flexibility to each class in a class hierarchy. Two-phase initialization prevents property values from being accessed before they are initialized, and prevents property values from being set to a different value by another initializer unexpectedly.

NOTE: Swift's two-phase initialization process is similar to initialization in Objective-C. The main difference is taht during phase1, Objective-C assigns zero or null values (such as `0` or `nil`) to every property. Swift's initialization flow is more flexible in that it lets you set custom initial values and can cope with types for which `0` or  `nil` is not valid default value.

Swift's compiler performs four helpful safety-checks to make sure the two-pahse initialization is completed without error:
* Safety check 1. A designated initializer must ensure that all of the properties introduced by its class are initialized before it delegates up to a superclass initializer.
As mention above, the memory for an object is only considered fully initialized once the initial state of all of its stored properties is known. In order for this rules to be satisfied, a designated initializer must make sure that all of its own proeprties are initialized before it hands off up to the chain.
* Safety check 2. A designated initializer must delegate up to a superclass initializer before assigning a value to an inherited property. If it doesn't, the new value the designated initializer assigns will be overwritted by the superclass as part of its own initialization.
* Saftey check 3. A convenience initializer msut delegate to another initializer before assigning a value to _any_ property (including properties defined by the same class). If it doesn't, the new value the convenience initializer assigns will be overwritten by its own class's designated initializer.
* Safety check 4. An initializer cannot call any instance methods, read the values of any instance properties or refer to `self` as a value until after the first phase of initialization is complete.

The class instance is not fully valid untile the first phase ends. Properties can only be accessed, and methods can only be called once the class instance is known to be valid at the end of the first phase.

Here's how two-phase initialization plays out, based on the four safety checks above:
#### Phase 1
* A designated or conveniecne initializer is called on class
* Memory for a new instance of that class is allocated. The memory is not yet initialized
* A designated initializer for that class confirms that all stored properties introduce by that class have a value. The memory for these stored properties is now initialized.
* The designated initializer hands off to a superclass initializer to perform the same task for its own stored properties.
* This continues up the class inheritance chain until the top of the chain is reached.
* Once the top of the chain is reached, and the final class in the chain has ensured that all of its stored properties have a value, the instance's memory is considered to be fully initialized, and phase 1 is complete.
#### Phase 2
* Working back down from the top of the chain, each designated initializer in the chain has the option to customize the instance further. Initializer are now able to access `self` and can modify its properties, call its intance methods and so on.
* Finally, any convenience initializers in the chain have the option to customize the instance to work with `self`
![Two Phase Initialization](twoPhaseInitialization01_2x.png "Two Phase Initialization")

In this example, initialization begins with a call to a convenience initializer on the subclass. This convenience initializer cannot yet modify any properties. It delegates acrose to a designated initializer from the same class.

The designated initializer makes sure that all of the subclass's properties have a value, as per safety check 1. It then calls a designated initiliazer on its superclass to continue the initialization up the chain.

The superclass's designated initializer makes sure that all of the superclass properties have a value. There are no further superclasses to initialize, and so no further delegation is need.

As soon as all properties of the superclass have an initial value, its memory is considered fully initialized and Phase 1 is complete

Here's how phase 2 looks for the same initialization call:
![Two Phase Initialization 2](twoPhaseInitialization02_2x.png "Two Phase Initialization 2")

The superclass's designated initializer now has an opportunity to customize the instance futher (although it does not have to).

Once the superclass's designated initializer is finished, the subclasss's designated initializer can perform additional customization.

Finally, once the subclass's designated initializer is finished, the convenience initializer that was originally called can perform additional customization.
*/
//: Move on to [Initializer Inheritance and Overriding](@next)
