//: Previous [Strings and Characters](@previous)
//: ## Unicode
//: _Unicode_ is an international standard for encoding, representing and processing text in different writing systems. It enables you to represent almost any character from any language in a standardize form, and to read and write those characters to and from an external source such as a text file or web page.

/*: 
 ### Unicode Scalar
 Behind the scenes, Swift's native `String` type is built from _Unicode scalar_ values. A Unicode scalar is a unique 21-bit number for a character or modifier, such as `U+0061` for `LATIN SMALL LETTER A` (`"a"`), or `U+1F425` for `FRONT-FACING BABY CHICK` (`"🐥"`)
 
 Unicode scalar is a unique 21-bit number for a character
 
 > NOTE: A Unicode scalar is any Unicode _code point_ in the range `U+0000` to `U+D7FF` inclusive or `U+E000` to `U+10FFFF` inclusive. Unicode scalars do not include the Unicode _surrogate pair_ code points, which are th ecode points in the range to `U+D800` to `U+DFFF` inclusive
 
 Note that not all 21-bit Unicode scalars are assigned to a character - come scalars are reserved for future assignments. Scalars that have been assigned to a character typically also have a name, such as `LATIN SMALL LETTER A` AND `FRONT-FACING BABY CHICK`.
 */
/// WHAT IS A SURROGATE PAIR code points?

//: ### Special Characters in String Literals
//: String literals can include the following special characters

"\0" // null character
"\\" // backslash
"\t" // horizontal tab
"\n" // line feed
"\r" // carriage return
"\"" // double quote
"\'" // single quote

//: An arbitrary Unicode scalar, written as `\u{`n`}` is a 1-8 digit hexadecimal number with a value equal to a valid Unicode code point
let min = 0x0000
let min2 = "\u{E000}"
let max = 0xD7FF
let max2 = "\u{10FFFF}"
//: The code below shows four examples of these special characters. The `wiseWords` constant contains two escaped double quote characters. The `dollarSign`, `blackHeart` and `sparklingHeart` contants demonstrat the Unicode scalr form
let wiseWords = "\"Imagination is more important than knowledge\" - Einstein"
let dollarSige = "\u{24}"
let blackHear = "\u{2665}"
let sparklingHeart = "\u{1F496}"

//: ### Extended Grapheme Clusters
//: Every instance of Swift's `Character` type represents a single _extended grapheme cluster_. An extended grapheme cluster is a sequence of one or more Unicode scalars that (when combined) produce a single human-readable character.
let eAcute: Character = "\u{E9}"
let combinedEAcute: Character = "\u{65}\u{301}"
//: Extended grapheme clusters are a flexible way to represent many complex script characters as a single `Character` value.
let precomposed: Character = "\u{D55C}"
let decomposed: Character = "\u{1112}\u{1161}\u{11AB}" // ᄒ, ᅡ, ᆫ
//: Extended grapheme clusters enable scalars for enclosing marks (such as `COMBINING ENCLOSING CIRCLE` or `U+20DD`) to enclose other Unicode scalars as part of a single `Character` value.
let enclosedEAcute: Character = "\u{E9}\u{20DD}"
//: Unicode scalars for regional indicator symbols can be combined in pairs to make a single `Character` value, such as this combination of `REGIONAL INDICATOR SYMBOL LETTER U` (`U+1F1FA`) and `REGIONAL INDICATOR SYMBOL LETTER S` (`U+1F1F8`)
let regionalIndicatorForUS: Character = "\u{1F1FA}\u{1F1F8}"
let regionalIndicatorForPH: Character = "\u{1F1F5}\u{1F1ED}"
//: Move on to [Counting Characters](@next)
