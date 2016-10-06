//: Previous [Unicode](@previous)
//: ### Counting Characters
//: To retrieve a count of the `Character` values in a string, use the `count` property of the string's `characters` property
let unusualMenagerie = "Koala 🐨, Snail 🐌, Penguin 🐧, Dromedary 🐪"
print("unusualMenagerie has \(unusualMenagerie.characters.count) characters")
//; Note that Swift's use of extended grapheme clusters for `Character` values means that string concatenation and modification may not always affect a string's character count.
var word = "cafe"
print("The number of character in \(word) is \(word.characters.count)")

word += "\u{301}"
print("The number of character in \(word) is \(word.characters.count)")
/*:
 > NOTE: Extended grapheme clusters can be composed of one or more Unicode scalars. This means that different characters—and different representations of the same character—can require different amounts of memory to store. Because of this, characters in Swift do not each take up the same amount of memory within a string’s representation. As a result, the number of characters in a string cannot be calculated without iterating through the string to determine its extended grapheme cluster boundaries. If you are working with particularly long string values, be aware that the `characters` property must iterate over the Unicode scalars in the entire string in order to determine the characters for that string.

The count of the characters returned by the `characters` property is not always the same as the length property of an `NSString` that contains the same characters. The length of an `NSString` is based on the number of 16-bit code units within the string’s UTF-16 representation and not the number of Unicode extended grapheme clusters within the string.”
 */
//: [Next](@next)
