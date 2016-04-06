//: Previous [Unowned References and Implicitly Unwrapped Optional Properties](@previous)
//: ## Strong Reference Cycles for Closures
/*:
You saw above how to strong refence cycle can be created when two class instance properties hold a strong reference to each other. You also saw how to use weak and unowned references to break these strong reference cycles.

A strong reference cycle can also occur if you assign a closure to a property of a class instance, and the body of that closure captures the instance. This capture might occur because the closure's body accesses a property of the instance, such as `self.someProperty` or because the closure calls a method on the instance, such as `self.someMethod()`. In either case, these accesses cause the closure to "capture" `self`, creating a strong reference cycle.

This strong reference cycle occurs because closures, like classes are _reference types_. When you assign a closure to a property, you are assigning a _reference_ to that closure. In essence it's the same problem as above-two strong references are keeping each other alive. However, rather than two class instances, this time it's a class instance and a closure that are keeping each other alive.

Swift provides an elegant solution to this problem, known as _closure capture_ list. However, before you learn how to break a strong reference cycle with a closure capture list, it is useful to understand how such a cyclce can be caused.

The example below shows how you can create a strong reference cycle when using a closure that references `self`. This example defines a clss called `HTMLElement`, which provides a simple model for an individual element within an HTML document:
*/
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
/*:
The `HTMLElement` class defines a `name` property, which indicates the name of the elemtn, such as `"h1"` for a heading element, `"p"` for a paragraph element, or `"br"` for a line break element. `HTMLElement` also defines an optional `text` property, which you can set to a string that represents the text to be rendered within that HTML element.
 
 In addition to these simple properties, the `HTMLElement` class defines a lazy property called `asHTML`. This property references a closure that combines `name` and `text` into an HTML string fragment. The `asHTML` property is of type `() -> String`, or a "function that takes no parameters and returns a `String` value"
 
 By default, the `asHTML` property is assigned a closure that returns a string representation of an HTML tag. This tag contains the optional `text` value if it exists, or no text content if `text` does not exist. For a paragraph element, the closure would return `"<p>some text</p>"` or `"<p />", depending on whether the `text` property equals `"some text"` or `nil`.
 
 The `asHTML` property is named and used somewhat like an instance method. However, because `asHTML` is a closure property rather than an instance method, you can replace the default value of the `asHTML` property with a custom closure, if you want to change the HTML rendering for a particular HTML element.
 
 For example, the `asHTML` property could be set to a closure that defaults to some text if the `text` property is `nil`, in order to prevent the representation from returning an empty HTML tag:
*/
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)"
}
print(heading.asHTML())
/*:
 The `asHTML` property is declared as a lazy property because it is only needed if and when the element actually needs to be rendered as a string value for some HTML output target. The fact that `asHTML` is a lazy property means that you can refer to `self` within the default closure, because lazy property will not be accessed until after initialization has been completed and `self` is known to exist.
 
 The `HTMLElement` class provides a single initializer, which takes a `name` argument and (if desired) a `text` argument to initialize a new element. The class also defines a deinitializer, which prints a message to show when an `HTMLElement` instance is deallocated.
 
 Here's how you use the `HTMLElement` class to create and print a new instance:
 */
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
/*:
 The `paragraph` variable above is defined as an _optional `HTMLElement`, so that it can be set to `nil` below to demonstrate the presence of a strong reference cycle
 
 Unfortunately, the `HTMLElement` class, as written above, creates a strong reference cycle between an `HTMLElement` instance and the closure used for its default `asHTML` value. Here's how the cycle looks:
 ![Closure Referency Cycle 1](closureReferenceCycle01_2x.png "Closure Referency Cycle 1")
 
 The instance's `asHTML` property holds a strong reference to its closure. However, because the closure refers to `self` within its body (as a way to reference `self.name` and `self.text`), the closure _captures_ self, which means that it holds a strong reference back to the `HTMLElement` instance. A strong reference cycle is created between the two.
 
 Even though the closure refers to `self` multiple times, it only captures one strong reference to the `HTMLElement` instance.
 
 If you set the `paragraph` variable to `nil` and break its strong reference to the `HTMLElement` instance, neither the `HTMLElement` instance nor its closure are deallocated, because of the strong reference cycle:
 */
paragraph = nil
/*: 
 Note that the message in the `HTMLElement` deinitializer is not printed which shows that the `HTMLElement` instance is not deallocated

 Move on to [Resolving Strong Reference Cycles for Closures](@next)
 */
