//: Previous [Strong Reference Cycles for Closures](@previous)
//: Resolving Strong Reference Cycles for Closures
/*:
 You resolve a strong reference cycle between a closure and a class instance by defining a _capture list_ as part of the closure's definition. A capture list defines the rules to use when capturing one or more reference types within the closure's body. As with strong reference cycles between two instances, you declare each captured reference to be a weak or unowned reference rather thana a strong reference. The appropriate choice of weak or unowned depends on the relationships between the different parts of your code.
 
 Self requires you to write `self.someProperty` or `self.someMethod()` (rather than just `someProperty` or `someMethod`) whenver you refer to a member of `self` within closure. This helps you to remember that it's possible to capture `self` by accident.
 
 ### Defining a Capture List
 Each item in a capture list is a pairing of the `weak` or `unowned` keyword with a reference to a class instance (such as `self`) or a variable initialized with some value (such as `delegate = self.delegate!`). These pairings are written within a pair of square braces, separated by commas.
 
 Place the capture list before a closure's parameter list and return type if they are provide
 */

//lazy var someClosure: (Int, String) -> String = {
//    [unowned self, weak self.delegate!] (index: Int, stringToProcess: String) -> String in
//    // closure body goes here
//}
//: If a closure does not specify a parameter list or return type because they can be infered from context, place the capture list at the very start of the closure, followed by the `in` keyword:
//lazy var someClosure: Void -> String = {
//    [unowned self, weak delagate = self.delegate!] in
//    // closure body goes here
//}
//: Weak and Unowned References
/*:
 Define a capture in a closure as an unowned reference when the closure and the instance it captures will always refer to each other, and will always to be deallocated at the same time.
 
 Conversely, defin a capture as a weak reference when the captured reference may become `nil` at some point in the future. Weak references are always of an optional type, and automatically become `nil` when the instance they reference is deallocated. This enables you to check for their existence within the closure's body.
 
 If the capture reference will never become `nil`, it should always be captured as an unowned reference, rather than a weak reference.
 
 An unowned reference is the appropriate capture method to use to resolve the strong reference cycle in the `HTMLElement` example from earlier.
 */
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
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
//: This implementation of `HTMLElement` is identical to the previous implementation, apart from the additio of a capture list within the `asHTML` closure. In this case, the capture list is `[unowned self]`, which means "capture self as an unowned reference rather than a strong reference"
var paragraph: HTMLElement? = HTMLElement(name: "p", text: "Hello world")
print(paragraph!.asHTML())
/*: 
 Here's how the references look with the capture list in place:
![Closure Referency Cycle 2](closureReferenceCycle02_2x.png "Closure Referency Cycle 2")
 
 This time, the capture of `self` by the closure is an unowned reference, and does not keep a strong hold on the `HTMLElemetn` instance it has captured. If you set the strong reference from the `paragraph` variable to `nil`, the `HTMLElemetn` instance is deallocated, as can be seen from the printing of its deinitializer message in the example below:
*/
paragraph = nil