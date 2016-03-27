//: Previous [Failable Initializer](@previous)
//: ## Required Initializer
//: You write the `required` modifier before the definition of a class initializer to indicate that every subclass of the class must implement that initializer
class SomeClass {
    required init() {
        // initializer implementation goes here
    }
}
//: You must also write the `required` modifier before every subclass implementation of a required initializer, to indicate that the initializer requirement applies to futher subclasses in the chain. You do not write the `override` when overriding a required designated initializer
class SomeSubClass: SomeClass {
    required init() {
        // subclass implementation of the required initializer goes here
    }
}
//: Move on to [Setting a Default Property Value with a Closure or Function](@next)
