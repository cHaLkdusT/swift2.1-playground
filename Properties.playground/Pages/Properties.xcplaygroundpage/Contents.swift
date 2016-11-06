//: # Properties
/*:
 _Properties_ associate values with a particular class, structure or enumeration. Stored properties store constant and variable values as part of an instance, where computed properties calculate (rather than store) a value. Computed properties are provided by classes, structues and enumerations. Store properties are provided only by classes and structures.
 
 Stored and computed properties are usually associated with instances of a particular type. However, properties can also be associated with the type itself. Such properties are known as type properties.
 
 In addition, you can define property observers to monitor changes in a property's value, which you can respond with custom actions. Property observers can be added to stored properties you define yourself, and also to properties that a subclass inherits from its superclass.
 
  ## Stored Properties
 In its simplest form, a stored property is a constant or variable that is stored as part of an instance of a particular class or structure. Stored properties can be either _variable stored properties_ (introduced by the `var` keyword) or _constant stored properties_ (introduced by the `let` keyword)
 
 You can provide a default value for a stored property as part of its definition. You can also set and modify the initial value for stored property during initialization. This is true even for constant stored properties.
*/
struct FixedLengthRange {
    var firstValue: Int
    let length: Int
}
var rangeOfThreeItems = FixedLengthRange(firstValue: 0, length: 3)
// The range now represents integer values from 0, 1 and 2
rangeOfThreeItems.firstValue = 6
// The range now represents integer values 6, 7 and 8

/*: 
 ## Stored Properties of Constant Structure Instances
 If you create an instance of a structure and assign that instance to a constant, you cannot modify the instance's properties, even if they were declared as variable properties:
 */
let rangeOfFourItems = FixedLengthRange(firstValue: 0, length: 4)
// rangeOfFourItems.firstValue = 6 // Compile error
/*:
 Because `rangeOfFourItems` is declared as a constant, it is not possible to change it `firstValue` property, even though `firstValue` is a variable property
 
 This behavior is due to structures being _value types_. When an instance of a value type is marked as a constatn, so are all of its properties
 
 The same is not true for classes, which are _reference types_. If you assign an instance of a reference type to a constant, you can still change that instance's variable properties.
*/

/*:
 ## Lazy Stored Properties
 A _lazy stored property_ is a property whose initial value is not calculated until the first time it is used. You indicate a lazy stored property by writing the `lazy` modifier before it declaration.
 
 > You must always declare a lazy property as a variable (with the `var` keyword), because its initial value might not be retrieved until after instance initialization completes. Constant properties must always have a value _before_ initialization completes, and therefore cannot be declared as lazy.
 
 Lazy properties are useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance's initialization is complete. Lazy properties are also useful when the initial value for a property requires complex or computationally expensive setup that should not be performed unless or until it is need.
*/
class DataImporter {
    // It is a class to import data from an external file.
    // The class is assumed to take a non-trivial amont of time to initialized
    var fileName = "data.txt"
    // The DataImporter class would provide data importing functionality here
}
class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}
let manager = DataManager()
manager.data.append("Some data")
manager.data.append("Some more data")
// the DataImporter instance for the importer property has not yet been created
print(manager.importer.fileName)
manager
//:
//:
/*:
 > If a property marked with the `lazy` modifier is accessed by multiple threads simultaneously and the property hs not yet been initialized, there is no guarantee that the property will be initialized only once.
 
 ### Store Properties and Instance Variables
 If you have experience in Objective-C, you may know that it provides _two_ ways to store values and references as part of a class instance. In addition to properties, you can use instance variables as a backing store for the values stored in a property.
 
 Swift unifies these concepts into a single property declaration. A Swift property does not have a corresponding instance variable, and the backing store for a property is not accessed directly. This approach avoids confusion about how the value is accessed in different contexts and simplifies the property's declaration into a single, definitive statement. All information about the property-including its name, type and memory management characteristices-is defined in a single location as part of the type's definition.
*/
//: Move on to [Computed Properties](@next)
