//: Previous [Basic Operators](@previous)
//: ### Remainder Operator
/*:
The _remainder operator_ (`a % b`) works out on how many multiples of `b` will fit inside `a` and returns the value that is left over (known as _remainder_)

The remainder operator (`%`) is also known as _modulo operator_ in other languages. However, its behavior in Swift for negative numbers means that it is, strictly speaking, a remainder rathern than a modulo operation
*/
/*:
Here's how the remainder operator works. To calculate `9 % 4`
![Remainder Integer](remainderInteger_2x.png "Remainder Integer")
*/
9 % 4
-9 % 4
-9 % -4
9 % -4
//: The sign of `b` is ignored for negative values of `b`. This means that `a % b` and `a % -b` always give the same answer

//: ### Floating-Point Reminder Calculations
//: Unlike the reminder operator in C and Objective-C, Swift's remainder operator can also operate on floating-point numbers
8 % 2.5
-8 % 2.5
//: ![Remainder Float](remainderFloat_2x.png "Remainder Float")
//: Move on to [Unary Operator](@next)
