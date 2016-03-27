//: Previous [Required Initializer](@previous)
//: Setting a Default Property Value with a Closure or Function
/*:
If a stored property's default value requires some customization or setup, you can use a closure or global function to provide a customized default value for that property. Whenever a new instance of the type that the property belongs to is initiazed, the closure or function is called, and its return value is assigned as the property's default value.

These kinds of closure or functions typically create a temporary value of the same type as the property, tailor that value to represent the desired initial state, and then return that temprorary value to be used as the property's default value.
*/
class SomeType { }
class SomeClass {
    let someProperty: SomeType = {
        // create a default value for someProperty inside this closure
        // someValue must be of the same type as SomeType
        return SomeType()
    }()
}
/*:
Note that the closure's end curly brace is followed by a an empty pair of parenthesis. This tells Swift to execute the closure immediately. If you omit these parethesis, you are trying to assign the closure itself to the property, and not the return value of the closure

If you use a closure to initialize a property, remember that the rest of the instance has not yet been initialized at the point that the closure is executed. This means that you cannot access any other property values from within your closure, even if those properties have default values. You also cannot use the implicity `self` property, or call any of the instance's methods.

Models a board for the game of _Checkers_ (also known as _Draughts_)
![Checkers Board](checkersBoard_2x.png "Checkers Board")

The game of _Checkers_ is played on a ten-by-ten board, with alternating black and white squares. To represent this game board, the `Checkerboard` structure has a single property called `boardColors`, which is an array of 100 `Bool` values. A value of `true` in the array represents a black square and a value of `false` represents a white square. The first item in the array represents the top left square on the board and the last item in the array represents the bottom right square on the board
*/
struct Checkerboard {
    let boardColors: [Bool] = {
        var temporaryBoard = [Bool]()
        var isBlack = false
        for i in 1...10 {
            for j in 1...10 {
                temporaryBoard.append(isBlack)
                isBlack = !isBlack
            }
            isBlack = !isBlack
        }
        return temporaryBoard
    }()
    
    func squareIsBlackAtRow(row: Int, column: Int) -> Bool {
        return boardColors[(row * 10) + column]
    }
}
//: Whenever a new `Checkerboard` instance is created, the closure is executed, and the default value of `boardColors` is calculated and returned. The closure in the example above calculates and sets the appropriate color for each square on the board in a temporary array called `temporaryBoard` and retuns this temporary array as the closure's return value once its setup is complete. The returned array value is stored in `boardColors` and can be querried with the `squareIsBlackAtRow` utility function.
let board = Checkerboard()
print(board.squareIsBlackAtRow(0, column: 1))
print(board.squareIsBlackAtRow(9, column: 9))
//: [Next](@next)
