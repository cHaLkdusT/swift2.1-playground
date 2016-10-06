//: Previous [Counting Characters](@previous)
//: ## Accessing and Modifying a String
//: You can access and modify a string through its methods and properties, or by using subscript syntax

//: ### String Indices
/*:
 Each `String` value has an associated _index_ type, `String.Index`, which corresponds to the position of each `Character` in the string.
 
 Use the `startIndex` property to acccess the positoin of the first `Character` of a `String`. The `endIndex` is the position after the last character in a `String. As a result, the `endIndex` property isn't a valid argument to a string's subscript. If a `String` is empty, `startIndex` and `endIndex` are equal
 
 You can access the indices before and afer a given index using the `index(before:)` and `index(after:)` methods of `String`. To access farther away from the given index, you can use the `index(_:offsetBy:)` method instead of calling one of these methods multiple times.
 */
let greeting = "Guten Tag!"
greeting[greeting.startIndex]
greeting[greeting.index(before: greeting.endIndex)]
greeting[greeting.index(after: greeting.startIndex)]
let index = greeting.index(greeting.startIndex, offsetBy: 7)
greeting[index]

//: Attempting to access a `Character` at an index outside of a string's range will trigger a runtime error
//greeting[greeting.endIndex]
//greeting.index(after: endIndex)

//: Use the `indices` property of the `characters` property to create a `Range` of all of the indexes used to access individual characters in a string.
for index in greeting.characters.indices {
    print("\(greeting[index]) ", terminator: "")
}
//: > NOTE: You can use the `startIndex` and `endIndex` properties and the `index(before:)`, `index(after:)` and `index(_:offsetBy:)` methods on any type that conforms to the `Collection` protocol. This includes `String`, as shown here, as well as collection types such as `Array`, `Dictionary` and `Set`.

// ### Inserting and Removing
var welcome = "hello"
welcome.insert("!", at: welcome.endIndex)
//: To insert the contents of another string a a specified index, use the `insertContentsOf(_:at:)` method
welcome.insert(contentsOf: " there".characters, at: welcome.index(before: welcome.endIndex))

//: To remove a character from a string at a specified index, use the `removeAtIndex(_:)` method
welcome.remove(at: welcome.index(before: welcome.endIndex))
welcome

let range = welcome.index(welcome.endIndex, offsetBy: -6)..<welcome.endIndex
welcome.removeSubrange(range)

//: > NOTE: You can use the `insert(_:at:)`, `insert(contentsOf:at:)`, `remove(at:)`, and `removeSubrange(_:)` methods on any type that conforms to the `RangeReplaceableCollectionProtocol` protocol. This includes `String` as shown here, as well as collection types such as `Array`, `Dictionary` and `Set`.

//: ## Comparing Strings
//: Swift provides three ways to compare textual values: string and character equality, prefix equality and suffix equality.

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

//: > NOTE: String and character comparisons in Swift are not locale-sensitive.

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

//: ## Unicode Representations of String
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