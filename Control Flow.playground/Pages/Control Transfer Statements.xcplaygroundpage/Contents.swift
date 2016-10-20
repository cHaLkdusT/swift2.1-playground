//: Previous [Conditional Statements](@previous)
//: ## Control Transfer Statements
/*:
 _Control transfer statements_ change the order in which your code is executed, by transferring control from one piece of code to another. Swifth has five control transfer statements:

 * `continue`
 * `break`
 * `fallthrough`
 * `return`
 * `throw`

 The `continue`, `break`, and `fallthrough` statements are described below. The `return` statement is described in `Functions`, and the `throw` is described in `Propagating Erros Using Throwing Functions`
*/
// ### Continue
// The `continue` statement tells a loop to stop what it is doing and start again at the beginning of the next iteration through the loop. It says "I am done with the current loop iteration" without leaving the loop altogether.
let puzzleInput = "great minds think alike"
var puzzleOutput = ""
for character in puzzleInput.characters {
    switch character {
    case "a", "e", "i", "o", "u", " ":
        continue
    default:
        puzzleOutput.append(character)
    }
}
print(puzzleOutput)

/*:
 The code above calls the `continue` keyword whenever it matches a vowel or a space, causing the current iteration of the loop to end immediately and to jump straight to the start of the next iteration.
 
 ### Break
 The `break` statement ends execution of an entire control flow statement immediately. The `break` statement can be used inside a switch statement or loop statement then you want to terminate the execution of the `switch` or loop statement earlier than would otherwise be the case
 
 #### Break in a Loop Statement
 When used inside a loop statement, `break` ends the loops execution immediately, and transfers control to the first line of code after the loop's closing brace (`}`).
 
 #### Break in a Switch Statement
 When used inside a `switch` statement, `break` cause the `switch` statement to end its execution immediately, and to transfer control to the first line of code after the `switch` statement's enclosing (`}`)
 
 > A `switch` case that contains only a comment is reported as a compile-time error. Comments are not statemetns and do not cause a `switch` case to be ignored. Always use a `break` statement to ignore a `switch` case.
 
 The following example switches on a `Character` value and determines whether it represents a number symbol in one of four languages.
*/
let numberSymbol: Character = "三"  // Simplified Chinese for the number 3
var possibleIntegerValue: Int?
switch numberSymbol {
case "1", "١", "一", "๑":
    possibleIntegerValue = 1
case "2", "٢", "二", "๒":
    possibleIntegerValue = 2
case "3", "٣", "三", "๓":
    possibleIntegerValue = 3
case "4", "٤", "四", "๔":
    possibleIntegerValue = 4
default:
    break
}

if let integerValue = possibleIntegerValue {
    print("The integer value of \(numberSymbol) is \(integerValue).")
} else{
    print("An integer value could not be found for \(numberSymbol).")
}

/*:
 ### Fallthrough
 Switch statements in Swift do not fall through the bottom of each case and into the next one. Instead, the entire switch statement completes its execution as soon as the first matching case is completed.
 
 > The `fallthrough` keyword does not check the case conditions for the `switch` case that it causes execution to fall into. The `fallthrough` keyword simply causes the code execution to move directly to the statements inside the next case (or `default` case) block, as in C's standard `switch` statement behavior.
*/
let integerToDescribe = 5
var description = "The number \(integerToDescribe) is"
switch integerToDescribe {
case 2, 3, 5, 7, 11, 13, 17, 19:
    description += " a prime number, and also"
    fallthrough
default:
    description += " an integer."
}
print(description)

/*:
 ### Labeled Statements
 You can nest loops and conditional statements inside other loops and conditional statements in Swift to create complex control flow structures.
 
 The following example uses the `break` and `continue` statements with a labeld `while` loop for an adapted version of the _Snakes and Ladders_
![Snakes and Ladders](snakesAndLadders_2x.png "Snakes and Ladders")
*/
let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare)
board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
var square = 0
var diceRoll = 0
//: This version of the game uses a `while` lopp and a `switch` statement to implement the game's logic. The `while` loop has a statement label called `gameLoop` to indicate that it is the main game loop for the Snakes and Ladders game.
gameLoop: while square != finalSquare {
    diceRoll += 1
    if diceRoll == 7 { diceRoll = 1 }
    switch square + diceRoll {
    case finalSquare:
        // diceRoll will move us to the final square, so the game is over
        break gameLoop
    case let newSquare where newSquare > finalSquare:
        // diceRoll will move us beyond the final square, so roll again
        continue gameLoop
    default:
        // this is a valid move, so find out its effect
        square += diceRoll
        square += board[square]
    }
}
print("Game over!")
//: Move on to [Early Exit](@next)
