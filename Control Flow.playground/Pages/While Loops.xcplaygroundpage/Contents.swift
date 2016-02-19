//: Previous [Control Flow](@previous)
//: ## While Loops
/*:
A `while` loop performs a set of statements until a condition becomes `false`. These kinds of loops are best used when the number of iterations is not known before the first iteration begins.

Swift provides two kinds of `while` loop:
* `while` evaluates its condition at the start of each pass through the loop
* `repeat-while` evaluates its condition at the end of each pass through the loop
### Whileasdf
A `while` loop starts by evaluating a single condition. If the condition is `true`, a set of statements is repeated until the condition becomes `false`

This example plays a simple game of _Snakes and Ladders_ (also known as _Chutes and Ladders_)
![Snakes and Ladders](snakesAndLadders_2x.png "Snakes and Ladders")
The rules of the games are as follows:
* The board has 25 squares, and the aim is to land on or beyond square 25
* Each turn, you roll a six-sided dice and move by that number of squares, following the horizontal path indicated by dotted arrow above
* If your turn ends at the bottom of a ladder, you move up that ladder
* If your turn ends at the head of a snake, you move down that snake

The game board is represented by an array of `Int` values. Its size is based on a constant called `finalSquare`, which is used to initialize the array and also to check for a win condition later in the example. The board is initialized with 26 zero `Int`, not 25 (one each at indixes `0` through `25` inclusive
*/
let finalSquare = 25
var board = [Int](count: finalSquare + 1, repeatedValue: 0)
/*
Some squares are then set to have more specific values for the snakes and ladders. Squares with a ladder base have a positive number to move you up the board, whereas squares with a snak head have a negative number to move you back down the board

The unary plus operator (`+i`) balances with the unary minus operator (`-i`), and numbers lower than `10` are padded with zeros so that all board definitions align.
*/
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
//: The player's starting square is "square zero", which is just off the bottom left corner of the board.
var square = 0
var diceRoll = 0
while square < finalSquare {
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
    if square < board.count {
        // if we're still on the board, move up or move down for a snake or a ladder
        square += board[square]
    }
}
print("Game over!")
/*:
This example uses a very simple approach to dice rolling. Each time through the `while` loop,  `diceRoll` is incremented by one and is then checked to see if has become too large. Whenever this return value equals 7, the dice roll has become too large, and is reset to a value of 1. This gives a sequence of `diceRoll` values that is always `1`, `2`, `3`, `4`, `5`, `6`, `1`, `2` and so on.

A `while` loops is appropriate in this case because the lenght of the game is not clear at the start of the `while` loop. Instead, the loops is executed until a particular condition is satisfied.
*/
//: ### Repeat-While
/*:
The other variation of the `while` loop, known as the `repeat-while` loops, performs a single pass throught the loop block first, _before_ considering the loop's condition. It then continues to repeat the loop until the condition is `false`.

The `repeat-while` loop in Swift is analogous to a `do-while` loop in other languages

Here's the _Snakes and Ladders_ example written as a `repeat-while` loop. In this version of the game, the _first_ aciton in the loops is to check for a ladder or a snake. No ladder on the board takes the player straight to square 25, and so it is not possible to win the game by moving up a ladder. Therefore, it is safe to check for a snake or a ladder as the first action in the loop.
*/
square = 0
diceRoll = 0
repeat {
    // move up or down for a snake or ladder
    square += board[square]
    // roll the dice
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    // move by the rolled amount
    square += diceRoll
} while square < finalSquare
print("Game over!")
//: Move on to [Conditional Statements](@next)
