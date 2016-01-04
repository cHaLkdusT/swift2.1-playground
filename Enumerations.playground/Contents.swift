/// ENUMERATIONS
/// ENUMERATIONS SYNTAX
enum SomeEnumeration {
    
}

enum CompassPoint {
    case North
    case South
    case East
    case West
}

enum Planet {
    case Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

var directionToHead = CompassPoint.West
directionToHead = .East

/// MATCHING ENUMERATION VALUES WITH A SWITCH STATEMENT
directionToHead = .South
switch directionToHead {
case .North:
    print("Lots of planets have a north")
case .South:
    print("Watch out for penguines")
case .East:
    print(("Where the sun rises"))
case .West:
    print("Where the skies are blue")
}

let somePlanet = Planet.Earth
switch somePlanet {
case .Earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}

/// ASSOCIATED VALUES
enum Barcode {
    case UPCA(Int, Int, Int, Int)
    case QRCode(String)
}
var productBarCode = Barcode.UPCA(8, 85909, 51226, 3)
productBarCode = .QRCode("ABCDEFGHIJKLMNOP")
switch productBarCode {
case .UPCA(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer) ,\(product), \(check)")
case .QRCode(let productCode):
    print("QR Code: \(productCode)")
}

switch productBarCode {
case let .UPCA(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer) ,\(product), \(check)")
case let .QRCode(productCode):
    print("QR Code: \(productCode)")
}

/// RAW VALUES
enum ASCIIControlCharacter: Character {
    case Tab = "\t"
    case LineFeed = "\n"
    case CarriageReturn = "\r"
}

/// IMPLICITYLY ASSIGNED RAW VALUES
enum Planet2: Int {
    case Mercury = 1, Venus, Earth, Mars, Jupiter, Saturn, Uranus, Neptune
}

enum CompassPoint2: String {
    case North, Sout, East, West
}
let earthsOrder = Planet2.Earth.rawValue
let sunsetDirection = CompassPoint2.West.rawValue

/// INITIALIZING FROM A RAW VALUE
let possiblePlanet = Planet2(rawValue: 7)
let positionToFind = 9
if let somePlanet = Planet2(rawValue: positionToFind) {
    switch somePlanet {
    case .Earth:
        print("Mostly harmless")
    default:
        print("Not a safe place for humans")
    }
} else {
    print("There isn't a plant at position \(positionToFind)")
}

/// RECURSIVE ENUMERATIONS
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    case Number(Int)
    case Addition(ArithmeticExpression2, ArithmeticExpression2)
    case Multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))