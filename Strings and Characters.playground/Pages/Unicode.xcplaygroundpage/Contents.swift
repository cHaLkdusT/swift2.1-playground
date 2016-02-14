//: Previous [Strings and Characters](@previous)
//: ## Unicode
//: _Unicode_ is an international standard for encoding, representing and processing text in different writing systems. It enables you to represent almost any character from any language in a standardize form, and to read and write those characters to and from an external source such as a text file or web page.
//: ### Unicode Scalar
/*:
Behind the scenes, Swift's native `String` type is built from _Unicode scalar_ values. A Unicode scalar is a unique 21-bit number for a character or modifier, such as `U+0061` for `LATIN SMALL LETTER A` (`"a"`), or `U+1F425` for `FRONT-FACING BABY CHICK` (`"🐥"`)

Unicode scalar is a unique 21-bit number for a character
*/
//: ### Special Characters in String Literals
/// WHAT IS A SURROGATE PAIR code points?

let min = 0x0000
let min2 = "\u{E000}"
let max = 0xD7FF
let max2 = "\u{10FFFF}"

"\0" // null character
"\\" // backslash
"\t" // horizontal tab
"\n" // line feed
"\r" // carriage return
"\"" // double quote
"\'" // single quote
//: The code below shows four examples of these special characters. The `wiseWords` constant contains two escaped double quote characters. The `dollarSign`, `blackHeart` and `sparklingHeart` contants demonstrat the Unicode scalr form
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSige = "\u{24}"
let blackHear = "\u{2665}"
let sparklingHeart = "\u{1F496}"
//: ### Extended Grapheme Clusters
//: Every instance of Swift's `Character` type represents a single _extended grapheme cluster_. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"

let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ

let enclosedEAcute: Character = "\u{E9}\u{20DD}"

let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorForPH: Character = "\u{1F1F5}\u{1F1ED}"
//: ### Counting Characters
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")

var word = "cafe"
print("The number of character in \(word) is \(word.characters.count)")

word += "\u{301}"
print("The number of character in \(word) is \(word.characters.count)")
//: ### Accessing and Modifying a String
//: You can access and modify a string thr
//: ### String Indices
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.endIndex.predecessor()]
greeting[greeting.startIndex.successor()]
let index = greeting.startIndex.advancedBy(7)
greeting[index]
//: Attempting to access a `Character` at an index outside of a string's range will trigger a runtime error
//greeting[greeting.endIndex]
//greeting.endIndex.successor()
//: Use the `indices` property of the `characters` property to create a `Range` of all of the indexes used to access individual characters in a string.
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
// ### Inserting and Removing
var welcome = "hello"
welcome.insert("!", atIndex: welcome.endIndex)
//: To insert the contents of another string a a specified index, use the `insertContentsOf(_:at:)` method
welcome.insertContentsOf(" threre".characters, at: welcome.endIndex.predecessor())
//: To remove a character from a string at a specified index, use the `removeAtIndex(_:)` method
welcome.removeAtIndex(welcome.endIndex.predecessor())
welcome
//: To remove a substring at a specified range, use the `removeRange(_:)` method
let range = welcome.endIndex.advancedBy(-6)..<welcome.endIndex
welcome.removeRange(range)
//: ## Comparing Strings
//: ### String and Character Equality
let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}

let eAcuteQuestion = "Voulez-vous un caf\u{E9}"
let combinedEACuteQuestion = "Voulez-vous un caf\u{65}\u{301}"
if eAcuteQuestion == combinedEACuteQuestion {
    print("These two strings are considered equal")
}

let latinCapitalLetterA: Character = "\u{41}"
let cyrillicCaptialLetterA: Character = "\u{0410}"
if latinCapitalLetterA != cyrillicCaptialLetterA {
    print("These two string a not equivalent")
}
//: ## Prefix and Suffix Equality
//: To check whether a string has a particular string prefix or suffix, call the string's `hasPrefix(_:)` and `hasSuffix(_:)` methods, both of which take a single argument tof type string and return a Boolean value
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
        act1SceneCount += 1
    }
}
print("There are \(act1SceneCount) scenes in Act 1")

var mansionCount = 0
var cellCount = 0
for scene in romeoAndJuliet {
    if scene.hasSuffix("Capulet's mansion") {
        mansionCount += 1
    } else if scene.hasSuffix("Friar Lawrence's cell") {
        cellCount += 1
    }
}
print("\(mansionCount) mansion scenes; \(cellCount) cell scenes")
//: These methods perform a character-by-character canonical equivalence comparisnon between the extended grapheme clusters in each strin
//: ## Unicod Representations of String
let dogString = "Dog\u{203C}🐶"
//: ### UTF-8 Representation
//: ![UTF-8](UTF8_2x.png "UTF-8")
for codeUnit in dogString.utf8 {
    print("\(codeUnit) ", terminator: "")
}
//: ### UTF-16 Representation
//: ![UTF-16](UTF16_2x.png "UTF-16")
for codeUnit in dogString.utf16 {
    print("\(codeUnit) ", terminator: "")
}
//: ### Unicode Scalar Representation
//: ![Unicode Scalar](UnicodeScalar_2x.png "Unicode Scalar")
for scalar in dogString.unicodeScalars {
    print("\(scalar.value) ", terminator: "")
}

for scalar in dogString.unicodeScalars {
    print(scalar)
}
//: Move on to [Next](@next)
