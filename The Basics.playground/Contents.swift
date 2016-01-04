/// CONSTANTS AND VARIABLES
let maximumNumberOfLoginAttempts = 10
var currentLoginAttempt = 0

var x = 0.0, y = 0.0, z = 0.0

var welcomeMessage: String
welcomeMessage = "Helo"

var red, green, blue: Double

/// NAMING CONSTANTS AND VARIABLES
var `var` = "var string"
print(`var`)

var friendlyWelcome = "Hello!"
friendlyWelcome = "Bonjour"

let languageName = "Swift"
//languageName = "Swift++"

/// PRINTING CONSTANTS AND VARIABLES
print(friendlyWelcome)
print("The current value of friendlyWelcome is \(friendlyWelcome)")

/// COMMENTS
// this is a comment
/* this is also a comment
but written over multiple lines */

/* This is the start of the first multiline comment
/* This is the second, nested multiline comment */
This is the end of the first multiline comment */

/// SEMICOLON
let cat = "🐱"; print(cat)

/// INTEGERS

/// INTEGER BOUNDS
let minValue = UInt8.min
let maxValue = UInt8.max

/// Int
// On a 32-bit platform, Int is the same size as Int32
// On a 64-bit platform, Int is the same size as Int64

/// UInt
// On a 32-bit platform, UInt is the same size as UInt32
// On a 64-bit platform, UInt is the same size as UInt64

/// FLOATING-POINT NUMBERS
// Decimal has a precision of at least 15 decimal digits
// Float has a precision of 6 decimal digits
// Double if preferred

/// TYPE SAFETY AND TYPE INFERENCE
let meaningOfLife = 42 // meaningOflife is inferred to be of type Int
let pi = 3.149 // pi is inferred to be of type Double
let anotherPi = 3 + 0.14159 // anotherPi is also inferred to be of type Double

/// NUMERIC LITERALS
let decimalInteger = 17
let binaryInteger = 0b10001
let octalInteger = 0o21
let hexadecimalInteger = 0x11

1.25e2 // means 1.25 x 10^2
1.25e-2 // means 1.25 x 10^-2

0xFp2 // means 15 x 2^2
0xFp-2 // means 15 x 2^-2

let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0

let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1

/// NUMERIC TYPE CONVERSION
// Use the Int type for all general-purpose integer constants and variables in your code, even if they are knonw to be non-negative

/// INTEGER CONVERSION
//let cannotBeNegative: UInt8 = -1
//let tooBig: Int8 = Int8.max + 1
let twoThousand: UInt16 = 2_000
let one: UInt8 = 1
let twoThousandAndOne = twoThousand + UInt16(one)

/// INTEGER AND FLOATING-POINT CONVERSION
let three = 3
let pointOneFourOneFiveNine = 0.14159
Double(three) + pointOneFourOneFiveNine

let integerPi = Int(pi)

/// TYPE ALIASES
typealias AudioSample = UInt16
var maxAmplitudeFound = AudioSample.min

/// BOOLEANS
let orangesAreOrange = true
let turnipsAreDelicious = false

if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnis are horrible!")
}

let i = 1
//if i {}
if i == 1 {}

/// TUPLES
let http404Error = (404, "Not Found")
let (statusCode, statusMessage) = http404Error
print("The status code is \(statusCode)")
print("The satatus message is \(statusMessage)")

let (justTheStatusCode, _) = http404Error
print("The status code is \(justTheStatusCode)")
print("The status code is \(http404Error.0)")
print("The status message is \(http404Error.1)")

let http200Status = (statusCode: 200, description: "OK")
print("The status code is \(http200Status.statusCode)")
print("The status message is \(http200Status.description)")


/// OPTIONALS
let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

/// nil
var serverResponseCode: Int? = 404
serverResponseCode = nil

var surveyAnswer: String? // surveyAnswer is automatically set to nil
// Swift's nil is not the same as nil in Objective-C. In Objective-C, nil is a pointer to a nonexistent object. Int Swift, nil is not a pointer - it is the absence of a value of a certain type. Optionals of any type can be set to nil, not just object types

/// IF STATEMENTS AND FORCED UNWRAPPING
if convertedNumber != nil {
    print("convertedNumber contains some integer value")
}

if convertedNumber != nil {
    print("convertedNumber has na integer value of \(convertedNumber!).")
}

/// OPTIONAL BINDING
if let actualNumber = Int(possibleNumber) {
    print("\'\(possibleNumber)\' has an integer value of \(actualNumber)")
} else {
    print("\'\(possibleNumber)\' could not be converted to an integer")
}

/// IMPLICIT UNWRAPPED OPTIONALS
let possibleString: String? = "An optional string."
let forcedString: String = possibleString!

let assumedString: String! = "An implicitly unwrapped optional string."
let implicitString: String = assumedString

if assumedString != nil {
    print(assumedString)
}

if let definiteString = assumedString {
    print(definiteString)
}

/// ERROR HANDLING
func canThrowAnError() throws {
    // this function may or may not throw an error
}
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//func makeASandwich() throws {
//    // ...
//}
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch Error.OutOfCleanDishes {
//    washDishes()
//} cathc Error.MissingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}

/// ASSERTIONS
let age = -3
//assert(age >= 0, "A person's age cannot be less than zero")

/// WHEN TO USE ASSERTIONS
