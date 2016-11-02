//: Previous [Enumerations](@previous)
enum CompassPoint {
    case north
    case south
    case east
    case west
}
var directionToHead = CompassPoint.west
enum Planet {
    case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}
//: # Matching Enumeration Values with a Switch Statement
//: You can match individual enumerations values with a `switch` statement
directionToHead = .south
switch directionToHead {
case .north:
    print("Lots of planets have a north")
case .south:
    print("Watch out for penguines")
case .east:
    print(("Where the sun rises"))
case .west:
    print("Where the skies are blue")
}
//: When it is not appropriate to provide a `case` for every enumeration case, you can provide a `default` case to cover any cases that are not addressed explicitly:
let somePlanet = Planet.earth
switch somePlanet {
case .earth:
    print("Mostly harmless")
default:
    print("Not a safe place for humans")
}
//: ## Associated Values
/*:
 You can define Swift enumerations to store associated values of any given type, and the value types can be different for each case of the enumeration if need. Enumerations similar to these are known as _discriminated unions, tagged unions or variants_ in other programming languages.
 
 Suppose an inventory tracking system needs to track products by two different types of barcode. Some products are labeld with 1D barcodes in UPC-A format, which uses the number `0` to `9`. Each barcode has a "number system" digit, followed by five "manufacture code" digits and five "product code" digits. These are followed by a "check" digit to verify that the code has been scanned correctly
 
 ![Barcode UPC](barcode_UPC_2x.png "Barcode UPC")
 
 Other products are labeled with 2D barcodes in QR code format, which can use any ISO 8859-1 character and can encode a string up to 2,953 long.
 
 ![Barcode QR](barcode_QR_2x.png "Barcode QR")
 
 It would be convinient for an inventory tracking system to be able to store UPC-A barcodes as a tuple of four integers, and QR code barcodes as a string of any length
*/
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
//: New barcodes can be created using either type
var productBarCode = Barcode.upc(8, 85909, 51226, 3)
//: Same produc can be assigned a different type of barcode
productBarCode = .qrCode("ABCDEFGHIJKLMNOP")
//: Different barcode types can be checked using a switch statement, as before. This time, however, the associated values can be extracted as part of the switch statement. You extract each associated value as a constant with the `let` prefix for use within the `switch` case's body:
switch productBarCode {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC-A: \(numberSystem), \(manufacturer) ,\(product), \(check)")
case .qrCode(let productCode):
    print("QR Code: \(productCode)")
}
//: If all associated values for an enumeratino case are extracted as constants, or if all extracted aas variables, you can place a single `let` annotation before the case name, for brevity
switch productBarCode {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC-A: \(numberSystem), \(manufacturer) ,\(product), \(check)")
case let .qrCode(productCode):
    print("QR Code: \(productCode)")
}
//: Move on to [Raw Values](@next)
