//: Previous [Global and Local Variables](@previous)
//: ## Type Properties
/*:
Instance properties are properties that belong to an instance of particular type. Every time you create a new instance of that type, it has its own set of property values, separate from any other instance.
You can also define properties that belong to the type itself, not to any one instance of that type. There will only be ever one copy of these properties, no matter how many instances of that type you create. These kinds of properties are called _type properties_.
Type properties are useful for defining values that are univseral to _all_ instances of a particular type, such as a constant property that all instance can use (like static constant in C), or a variable property that stores a value that is global to all instance of that type (like static variable in C)
Stored type properties can be variables or constants. Computed type properties are always declared as variable properties, in the same way as computed instance properties.
Unlike store instance properties, you must always give stored type properties a default value. This is because the type itself does not have an initializer that can assign a value to a stored type property at initialization time.
Stored type properties are lazily initialized on their first access. They are guaranteed to be initialized only once, even when accessed by multiple threads simulataenously, and they do not need to be marked with the `lazy` modifier.
*/
//: ### Type Property Syntax
/*:
In C and Objective-C, you define static constants and variables associated with a type as _global_ static variables. In Swift, however, type properties are written as part of the type's definition, within the type's outer curly braces, and each type property is explicitly scoped to the type it supports
You define type properties with the `static` keyword. For computed type properties for class types, you can use the `class` keyword instead to allow subclasses to override the superclass's implementation.
*/
struct SomeStructure {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 1
    }
}
enum SomeEnumeration {
    static var storedTypeProperty = "Some value"
    static var computedTypeProperty: Int {
        return 6
    }
}
class SomeClass {
    static var storedTypeProperty = "Some value"
    static var computedTypePropery: Int {
        return 27
    }
    class var overridableComputedTypeProperty: Int {
        return 107
    }
}
//: The computed type property examples above are for read-only computed type properties, but you can also defined read-write computed type properties with the same syntax as for computed instnce properties
//: ### Querying and Setting Type Properties
//: Type properties are queried and set with dot syntax, just like instance properties. However, type properties are querried and set on the _type_, not on an instance of that type.
print(SomeStructure.storedTypeProperty)
SomeStructure.storedTypeProperty = "Another value"
print(SomeStructure.storedTypeProperty)
print(SomeEnumeration.computedTypeProperty)
print(SomeClass.computedTypePropery)
//: ![Static Properties VU Meter](staticPropertiesVUMeter_2x.png "Static Properties VU Meter")
struct AudioChannel {
    static var thresholdLevel = 10
    static var maxInputLevelForAllChannels = 0
    var currentLevel: Int = 0 {
        didSet {
            if currentLevel > AudioChannel.thresholdLevel {
                // cap the new audiot level to the threshold level
                currentLevel = AudioChannel.thresholdLevel
            }
            if currentLevel > AudioChannel.maxInputLevelForAllChannels {
                // store this as the new overall maximum inpunt level
                AudioChannel.maxInputLevelForAllChannels = currentLevel
            }
        }
    }
}
//: You can use the `AudioChannel` structure to create two new audio channels called `leftChannel` and `rightChannel`, to represent the audio levels of a stereo sound system
var leftChannel = AudioChannel()
var rightChannel = AudioChannel()
//: If you set the `currentLevel` of the _left_ channel to `7`, you can see that the `maxInputLevelForAllChannels` type property is updated to equal `7`
leftChannel.currentLevel = 7
print(leftChannel.currentLevel)
//: If you try to set the currentLevel of the _right_ channel to `11`, you can see that the right channel's `currentLevel` property is capped to the maximum value of `10` and the `maxInputLevelForAllChannels` type property is updated to equal 10
print(AudioChannel.maxInputLevelForAllChannels)
rightChannel.currentLevel = 11
print(rightChannel.currentLevel)
print(AudioChannel.maxInputLevelForAllChannels)