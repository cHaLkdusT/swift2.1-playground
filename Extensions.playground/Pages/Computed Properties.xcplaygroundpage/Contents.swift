//: Previous [Extensions](@previous)
/*:
 ## Computed Properties
Extensions can add computed instance properties and computed type properties to existing types. This example adds five computed instance properties to Swift's built-in `Double` type, to provide basic support for working with distance units:
*/
extension Double {
    var km: Double { return self * 1_000.0 }
    var m: Double  { return self }
    var cm: Double { return self / 100.0 }
    var mm: Double { return self /  1_000.0 }
    var ft: Double { return self / 3.28084 }
}

let oneInch = 25.4.mm
print("One inch is \(oneInch) meters")
let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")
/*:
 These computed propertiess express that a `Double` value should be considered as a certain unit of length. Although they are implemented as computed properties, the names of theses properties can be appended to a floating-poing literal value with dot syntax, as a way to use that literal value to perform distance conversions.
 
 In this example, a `Double` value of `1.0` is considered to represent "one meter". This is why the `m` computed property returns `self`- the expression `1.m` is considered to calculate a `Double` value of `1.0`.
 
 Other units require some conversion to be expressed as a value measured in meters. One kilometer is the same as 1,000 meteres, so the `km` computed property multiplies the value by `1_000.00` to convert into a number expressed in meters. Similarly, there are 3.28084 feet in a meter, and so the `ft` comptuted property divices the underlying `Double` value by `3.28084`, to convert it from feet to meters.
 
 These properties are read-only computed properties and so they are expressed without the `get` keyword, for brevity. Their return value is of type `Double`, and can be used within mathematical calculations wherever a `Double` is accepted.
 */
let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")
//: NOTE: Extensions can add new computed properties, but they cannod add stored properties, or add property observers to existing properties.

//: Move on to [Initializers](@next)
