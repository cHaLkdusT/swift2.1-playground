//: Previous [Matching Enumeration Values with a Switch Statement](@previous)
//: ## Raw Values
/*:
The barcode example in Associated Values shows how cases of an enumeration can declare that they store associated values of different types. As an alternative to associated values, enumeration cases can come prepopulated with default values (called _raw values_), which are all of the same type.
*/
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}
//:Raw values can be strings, characters or any of the integer or floating-point number types. Each raw value must be unique within its enumeration declaration.
// ### Implicitly Assigned Raw Values
/*:
When you're working with enumerations that store integer or string raw values, you don't have to explicitly assign raw value for each case. When you don't, Swift will automatically assign the values for you.
When integers are used for raw values, the implicit value for each case is one more than the previous case. If the first case doesn't have a value set, its value is `0`.
The enumeration below is a refinement of the earlier `Planet` enumeration, with integer raw values to represent each planet's order from the sun.
*/
enum Planet: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}
//: The enumeration below is a refinement of the earlier `CompassPoint` enumeration, with string raw values to represent each direction's name:
enum CompassPoint: String {
    case North, Sout, East, West
}
let earthsOrder = Planet.Earth.rawValue
let sunsetDirection = CompassPoint.West.rawValue
//: ## Initializing from a Raw Value
//: If you define an enumeration with a raw-value type, the enumeration automatically receives an initializer that takes a value of the raw value's type (as a parameter call `rawValue`) and returns either an enumeration case or `nil`. You can use initializer to try to create a new instance of the enumeration.
let possiblePlanet = Planet(rawValue: 7)
//: IF you try to find a planet with a position of `9`, the optional `Planet` value returned by the raw value initializer will be `nil`
let positionToFind = 9
if let somePlanet = Planet(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a plant at position \(positionToFind)")
}
//: Move on to [Recursive Enumerations](@next)