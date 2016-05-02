//: [Collections of Protocol Types](@previous)
protocol RandomNumberGenerator {
    func random() -> Double
}
class LinearCongruentialGenerator: RandomNumberGenerator {
    var lastRandom = 42.0
    let m = 139968.0
    let a = 3877.0
    let c = 29573.0
    func random() -> Double {
        lastRandom = ((lastRandom * a + c) % m)
        return lastRandom / m
    }
}
class Dice {
    let sides: Int
    let generator: RandomNumberGenerator
    init(sides: Int, generator: RandomNumberGenerator) {
        self.sides = sides
        self.generator = generator
    }
    func roll() -> Int {
        return Int(generator.random() * Double(sides)) + 1
    }
}

protocol DiceGame {
    var dice: Dice { get }
    func play()
}

protocol DiceGameDelegate {
    func gameDidStart(game: DiceGame)
    func game(game: DiceGame, didStartNewTurnWithDiceRoll diceRoll: Int)
    func gameDidEnd(game: DiceGame)
}

class SnakeAndLadders: DiceGame {
    let finalSquare = 25
    let dice = Dice(sides: 6, generator: LinearCongruentialGenerator())
    var square = 0
    var board: [Int]
    init() {
        board = [Int](count: finalSquare + 1, repeatedValue: 0)
        board[03] = +08; board[06] = +11; board[09] = +09; board[10] = +02
        board[14] = -10; board[19] = -11; board[22] = -02; board[24] = -08
    }
    var delegate: DiceGameDelegate?
    func play() {
        square = 0
        delegate?.gameDidStart(self)
        gameLoop:
            while square != finalSquare {
                let diceRoll = dice.roll()
                delegate?.game(self, didStartNewTurnWithDiceRoll: diceRoll)
                switch square + diceRoll {
                case finalSquare:
                    break gameLoop
                case let newSqure where newSqure > finalSquare:
                    continue gameLoop
                default:
                    square += diceRoll
                    square += board[square]
                }
        }
        delegate?.gameDidEnd(self)
    }
}
protocol TextRepresentable {
    var textualDescription: String { get }
}
extension Dice: TextRepresentable {
    var textualDescription: String {
        return "A \(sides)-sided dice"
    }
}
extension SnakeAndLadders: TextRepresentable {
    var textualDescription: String {
        return "A game of Snakes and Ladders with \(finalSquare) squares"
    }
}
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}
let game = SnakeAndLadders()
//: Protocol Inheritance
//: A protocol can _inherit_ one or more other protocols and can add further requirements on top of the requirements it inherits. The syntax for protocol inheritance is similar to the syntax for class inheritance, but with the option to list multiple inherited protocols, separated by commas:
protocol SomeProtocol { }
protocol AnotherProtocol { }
protocol InheritingProtocol: SomeProtocol, AnotherProtocol {
    // protocol definition goes here
}
//: Here's an example of a protocol that inherits the `TextRepresentable protocol above:
protocol PrettyTextRepresentable: TextRepresentable {
    var prettyTextualDescription: String { get }
}
/*:
 This example defines a new protocol, `PrettyTextRepresentable`, which inherits from `TextRepresentable`. Anything that adopts `PrettyTextRepresentable` must satisfy all of the requirements enforced by `TextRepresentable`, _plus_ the additional requirements enforced by `PrettyTextRepresentable`. In this example, `PrettyTextRepresentable` adds a single requirement to provide a gettable property called `prettyTextualDescription` that returns a `String`
 */
extension SnakeAndLadders: PrettyTextRepresentable {
    var prettyTextualDescription: String {
        var output = textualDescription + ":\n"
        for index in 1...finalSquare {
            switch board[index] {
            case let ladder where ladder > 0:
                output += "△ "
            case let snake where snake < 0:
                output += "▽ "
            default:
                output += "◦ "
            }
        }
        return output
    }
}
/*: This extension states that it adopts the `PrettyTextRepresentable` protocol and provides an implementation of the `prettyTextualDescription` property for the `SnakesAndLadders` type. Anything that is `PrettyTextRepresentable` must also be `TextRepresentable, and so the implementation of `prettyTextualDescription` starts by accessing the `textualDescription` property from the `TextRepresentable` protocol to being an output string. It appends a colon and a line pbreak, and uses this as the start of its pretty text representation. It then iterates through the array of board squares and appends a geometric shape to represent the contents of each square:
 
 * If the square's value is greater than `0`, it is the base of a ladder and is represented by `△`.
 * If the square's value is less than `0`, it is the head of a snake and is represented by `▽`.
 * Otherwise, the square's value is `0`, and it is a "free" square, represented by `◦`.
 
 The `prettyTextualDescription` property can now be used to print pretty text description of any `SnakesAndLadders`instances:
 */
print(game.prettyTextualDescription)
//: Move on to [Class-Only Protocols](@next)
