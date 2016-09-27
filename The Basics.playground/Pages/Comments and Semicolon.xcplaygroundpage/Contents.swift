//: Previous [Constants and Variables](@previous)
//: ### Comments
//: Single-line comments begin with two forward-slashes (//)
// this is a comment
//: Multiline comments starts with a forward-slash followed by an askterisk (/*) and end with an asterisk followed by a forward-slash (*/)
/* this is also a comment
but written over multiple lines */
//: Unlike multiline comments in C, multiline comments in Swift can be nested inside other multiline comments. You write nested comments by starting a multiline comment block and then starting a second multiline comment within the first block. The second block is then closed, followed by the first block:
/* This is the start of the first multiline comment
/* This is the second, nested multiline comment */
This is the end of the first multiline comment */
//: ### Semicolon
//: Swift does not required you to write a semicolon (;) after each statement in your code, although you can do so if you wish. However, semicolons _are_ required if you want to write multiple separate statements on a single line
let cat = "🐱"; print(cat)
//: Move on to [Integers and Floating-point numbers](@next)
