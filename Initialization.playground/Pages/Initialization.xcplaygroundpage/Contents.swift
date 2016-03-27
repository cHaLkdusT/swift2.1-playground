//: # Initialization
/*: 
_Initialization_ is the process of preparing an instance of a class, structure or enumeration for use. This process involves setting an initial value for each stored property on that instance and performing any other setup or initialization that is required before the new instance is ready to use.
You implement this initialization process by definine _initializers_, which are like special methods that can be called to create a new instance of a particular type. Unlike Objective-C initializers, Swift initializers do not return a value. Their primary role is to ensure that new instance of a type are correctly initialized before they are used for the first time.
Instances of class types can also implement a _deinitializer_, which performs any custom cleanup just before an instance of that class is deallocated.
*/
//: Setting Initial Values for Store Properties
/*:
Classes and strucutures _must_ set all of their store properties to an appropriate initial value by the time an instance of that class or structure is created. Store properties cannot be left in an indeterminate state.
You can set an initial value for a stored property within an initializer, or by assigning a default property value as part of the property's definition
When you assign a default value to a stored property, or set its initial value within an initializer, the value of that property is set directly, without calling any property observers.
*/
//: ### Initializers
//: _Initializers_ are called to create a new instance of a particular type. In its simplest form, an initializer is like an instance method with no parameters, written using the `init` keyword
// init() {
    // perform some initialization here
// }

struct Fahrenheit {
    var temperature: Double
    init() {
        temperature = 32.0
    }
}
var f = Fahrenheit()
print("The default temperature is \(f.temperature) Fahrenheit")
//: The strucutre defines a single initializer, `init`, with no parameters, which initializes the stored temperature with a value of `32.0` (the freezing point of water in degrees Fahrenheit)
//: ### Default Property Values
/*:
You can set the initial value of a store property from within an initializer, as shown above. Alternatively, specify a _default proeprty value_ as part of the property's declaration. You specify a default property by assigning an initial value to the property when it is defined.
If a property always take the same initial value, provide a default value rather than setting a value within an initializer. The end result is the same, but the default value ties the property's initialization more closely to its declaration. It makes for shorter, clearer initializers and enables you to infer the type of the property from its default value. The default value also makes it easier for you to take advantage of default initializers and initializer inheritance.
You can write the `Fahrenheit` structure from above in a simpel form by providing a default value for its `temperature` property at the point the property is declared
*/
struct Fahrenheit2 {
    var temperature = 32.0
}
//: Move on to [Customizing Initialization](@next)
