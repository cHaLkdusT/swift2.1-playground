//: Previous [Overriding](@previous)
//: ## Preventing Overrides
/*:
You can prevent method, property or subscript from being overriddeng by marking it as _final_. Do this by writing the `final` modifier before the method, property or subscript's introducer keyword 
* `final var`
* `final func`
* `final class func`
* `final subscript`
Any attempt to overrdie a final method, property or subscript in a subclass is reported as a compile-time error. Methods, properties or subscripts that you add to a class in an extension class can also be marked as final within the extension's definition
You can mark an entire class as final by writing the `final` modifier before the `class` keyword in its class definition (`final class`). Any attempt to subclass a final class is reported as a compile-time error.
*/
