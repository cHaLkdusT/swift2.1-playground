/// BASIC OPERATORS

/// TERMINILOGY
// unary, binary, ternary

/// ASSIGNMENT OPERATOR
let b = 10
var a = 5
a = b

let (x, y) = (1, 2)
// = does not return a value
// if x = y { } 

/// ARITHMETIC OPERATORS

1 - 2
5 - 3
2 * 3
10.0 / 2.5

"hello, " + "world"

/// REMAINDER OPERATOR
9 % 4
-9 % 4

/// FLOATING-POINT REMAIND CALCULATIONS
8 % 2.5

/// INCREMENT AND DECREMENT OPERATORS
var i = 0
++i

var c = 0
let d = ++c
c

let e = c++
c

/// UNARY MINUS OPERATOR
let three = 3
let minusThree = -three
let plustThree = -minusThree

/// UNARY PLUS OPERATOR
let minusSix = -6
let alsoMinusSix = +minusSix

/// COMPOUND ASSIGNMETN OPERATORS
var f = 1
f += 2

1 == 1
2 != 1
2 > 1
1 < 2
1 >= 1
2 <= 1

let name = "world"
if name == "world" {
    print("hello, world!")
} else {
    print("I'm sorry \(name), but I dont' recognize you")
}

/// TERNARY CONDITIONAL OPERATOR
let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

/// NIL COALESCING OPERATOR
let defaultColorName = "red"
var userDefinedColorName: String?
var colorNameToUse = userDefinedColorName ?? defaultColorName

userDefinedColorName = "green"
colorNameToUse = userDefinedColorName ?? defaultColorName

/// RANGE OPERATORS
/// CLOSE RANGE OPERATOR
for index in 1...5 {
    print("\(index) times 5 i s \(index * 5)")
}

/// HALF-OPEN RANGE OPERATOR
let names = ["Anna", "Alex", "Brian", "Jack",]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i]).")
}

/// LOGICAL OPERATORS
/// LOGICAL NOT OPERATOR
let allowedEntry = false
if !allowedEntry {
    print("ACCESS DENIED")
}

/// LOGICAL AND OPERATOR
let enteredDoorCode = true
let passedRetinaScan = false
if enteredDoorCode && passedRetinaScan {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

/// LOGICAL OR OPERATOR
let hasDorrKey = false
let knowsOverridePassword = true
if hasDorrKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

/// COMBINING LOGICAL OPERATORS
if enteredDoorCode && passedRetinaScan || hasDorrKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESS DENIED!")
}

/// EXPLICIT PARENTHESIS
if (enteredDoorCode && passedRetinaScan) || hasDorrKey || knowsOverridePassword {
    print("Welcome!")
} else {
    print("ACCESSED DENIED")
}

/// STRINGS AND CHARACTERS
/// STRING LITERALS
let someString = "Some string literal value"

/// INITIALIZING AN EMPTY STRING
var emptyString = ""
var anotherEmptyString = String()

if emptyString.isEmpty {
    print("Nothing to see here")
}

/// STRING MUTABILITY
var variableString = "Horse"
variableString += " and carriage"

let constantString = "Highlander"
//constantString += " and another Highlander"

/// WORKING WITH CHARACTERS
for character in "Dog!🐶".characters {
    print(character)
}

let exclamationMark: Character = "!"
let catCharacters: [Character] = ["c", "a", "t", "!", "🐱"]
let catString = String(catCharacters)
print(catString)

/// CONCATENATING STRINGS AND CHARACTERS
let string1 = "hello"
let string2 = " there"
var welcome = string1 + string2

var instruction = "look over"
instruction += string2

welcome.append(exclamationMark)

/// STRING INTERPOLATION
let multiplier = 3
let message = "\(multiplier) times 2.5 is \(Double(multiplier) * 2.5)"

/// UNICODE
/// UNICODE SCALAR
// Unicode scalar is a unique 21-bit number for a character or midoer

/// SPECIAL CHARACTERS IN STRING LITERAL
"\0" // null character
"\\(multiplier)" // bacslash
"\t" // horizontal tab
"\n" // line feed
"\r" // carriage return
"\"" // double quote
"\'" // single quote
"\u{1F396}"

/// EXTENDED GRAPHEME CLUSTERS
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}"

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"

/// COUNTING CHARACTERS
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("The nuber of character in \(word) is \(word.characters.count)")

word += "\u{301}"
print("The nuber of character in \(word) is \(word.characters.count)")

/// ACCESSING AND MODIFYING A STRING
/// STRING INDICES
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = advance(greeting.startIndex, 7)
greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", appendNewLine: false)
}

/// INSERTING AND REMOVING
var welcome2 = "hello"
welcome2.insert("!", atIndex: welcome2.endIndex)
welcome2.splice(" there".characters, atIndex: welcome2.endIndex.predecessor())
welcome2.removeAtIndex(welcome.endIndex.predecessor())
welcome2

let range = advance(welcome2.endIndex, -6)..<welcome2.endIndex
welcome.removeRange(range)

/// COMPARING STRINGS
/// STRING AND CHARACTER EQUIALITY
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEACuteQuestion = "Voluez-vous un caf\u{65}\u{301}"
if eAcuteQuestion == combinedEACuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCaptialLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCaptialLetterA {
    print("These two string a not equivalent")
}

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell",
]

var act1SceneCount = 0
for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        ++act1SceneCount
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        ++mansionCount
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        ++cellCount
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")

/// UNICODE REPESENTATION OF STRINGS
let dogString = "Dog\u{203C}🐶"

for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", appendNewline: false)
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", appendNewline: false)
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", appendNewline: false)
}
print("")

print("\u{1F436}")

for scalar in dogString.unicodeScalars {
    print(scalar)
}