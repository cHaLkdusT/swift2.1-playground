//: Previous [Strings and Characters](@previous)
//: ## Unicode
//: _Unicode_ is an international standard for encoding, representing and processing text in different writing systems. It enables you to represent almost any character from any language in a standardize form, and to read and write those characters to and from an external source such as a text file or web page.
//: ### Unicode Scalar
/*: 
Behind the scenes, Swift's native `String` type is built from _Unicode scalar_ values. A Unicode scalar is a unique 21-bit number for a character or modifier, such as `U+0061` for `LATIN SMALL LETTER A` (`"a"`), or `U+1F425` for `FRONT-FACING BABY CHICK` (`"🐥"`)

Unicode scalar is a unique 21-bit number for a character
*/
//: ### Special Characters in String Literals
"\0" // null character
"\\(multiplier)" // backslash
"\t" // horizontal tab
"\n" // line feed
"\r" // carriage return
"\"" // double quote
"\'" // single quote
"\u{1F396}"
//: ### Extended Grapheme Clusters
//: Every instance of Swift's `Character` type represents a single _extended grapheme cluster_. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
//: ### Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("The number of character in \(word) is \(word.characters.count)")

word += "\u{301}"
print("The number of character in \(word) is \(word.characters.count)")
//: ### Accessing and Modifying a String
//: You can access and modify a string thr
/// STRING INDICES
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
//let index = advance(greeting.startIndex, 7)
//greeting[index]

for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}

/// INSERTING AND REMOVING

var welcome2 = "hello"
welcome2.insert("!", atIndex: welcome2.endIndex)
//welcome2.splice(" there".characters, atIndex: welcome2.endIndex.predecessor())
//welcome2.removeAtIndex(welcome.endIndex.predecessor())
welcome2

//let range = advance(welcome2.endIndex, -6)..<welcome2.endIndex
//welcome.removeRange(range)

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
    print("\(codeUnit) ", terminator: "")
}
print("")

for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
print("")

for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}
print("")

print("\u{1F436}")

for scalar in dogString.unicodeScalars {
    print(scalar)
}
//: Move on to [Next](@next)
