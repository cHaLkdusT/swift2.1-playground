//: Previous [Matching Enumeration Values with a Switch Statement](@previous)
//: ## Raw Values
/*:
The barcode example in Associated Values shows how cases of an enumeration can declare that they store associated values of different types. As an alternative to associated values, enumeration cases can come prepopulated with default values (called _raw values_), which are all of the same type.
*/
enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}
//:Raw values can be strings, characters or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.
//: > Raw values are _not_ the same as associated values. Raw values are set to prepopulate values when you first define the enumeration in your code, like the three ASCII codes above. The raw value for a particular enumerations case is always the same. Associated values are set when you create a new constant or variable based on one foe the enumberation's cases, and can be different each time you do so.

/*:
 ### Implicitly Assigned Raw Values
 
 When you're working with enumerations that store integer or string raw values, you don't have to explicitly assign raw value for each case. When you don't, Swift will automatically assign the values for you.
 
 When integers are used for raw values, the implicit value for each case is one more than the previous case. If the first case doesn't have a value set, its value is `0`.
 
 The enumeration below is a refinement of the earlier `Planet` enumeration, with integer raw values to represent each planet's order from the sun.
*/
enum Planet: Int {
    case mercury = 1, venus, earth, mars, jupiter, saturn, eranus, neptune
}
//: The enumeration below is a refinement of the earlier `CompassPoint` enumeration, with string raw values to represent each direction's name:
enum CompassPoint: String {
    case north, south, east, west
}
let earthsOrder = Planet.earth.rawValue
let sunsetDirection = CompassPoint.west.rawValue
//: ## Initializing from a Raw Value
//: If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type (as a parameter call `rawValue`) and returns either an enumeration case or `nil`. You can use initializer to try to create a new instance of the enumeration.
let possiblePlanet = Planet(rawValue: 7)
//: > The raw value initializer is a failable initializer, because ont every raw value will return an enumerations case.

//: If you try to find a planet with a position of `9`, the optional `Planet` value returned by the raw value initializer will be `nil`
let positionToFind = 9
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a plant at position \(positionToFind)")
}
//: Move on to [Recursive Enumerations](@next)
