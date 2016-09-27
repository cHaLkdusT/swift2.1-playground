//: Previous [Type Safety and Type Inference](@previous)
//: ## Numeric Literals
// A _decimal_ number, with no prefix
let decimalInteger = 17
// A _binary_ number, with `0b` prefix
let binaryInteger = 0b10001
// A _octal_ number, with a `0o` prefix
let octalInteger = 0o21
// A _hexadecimal_ number, with a `0x` prefix
let hexadecimalInteger = 0x11
//: Decimal floats can also have an optional _exponent_, indicated by an uppercase or lowercase `e`.
1.25e2 // means 1.25 x 10^2
1.25e-2 // means 1.25 x 10^-2

0xFp2 // means 15 x 2^2
0xFp-2 // means 15 x 2^-2
//: All of these floating-point have an equal decimal value
let decimalDouble = 12.1875
let exponentDouble = 1.21875e1
let hexadecimalDouble = 0xC.3p0
//: Numeric literals can contain extra formatting to make them easier to read Both integers and flaots can be padded with extra zeros and can contain underscores to help with readability.
let paddedDouble = 000123.456
let oneMillion = 1_000_000
let justOverOneMillion = 1_000_000.000_000_1
//: Move on to [Numeric Type Conversion](@next)
