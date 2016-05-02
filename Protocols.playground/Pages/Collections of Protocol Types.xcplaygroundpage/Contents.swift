//: Previous [Adding Protocol Conformance with an Extension](@previous)
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
protocol TextRepresentable {
    var textualDescription: String { get }
}
struct Hamster {
    var name: String
    var textualDescription: String {
        return "A hamster named \(name)"
    }
}
extension Hamster: TextRepresentable {}

let game = SnakeAndLadders()
let d12 = Dice(sides: 12, generator: LinearCongruentialGenerator())
let simonTheHamster = Hamster(name: "Simon")
//: ## Collections of Protocol Types
//: A protocol can be used as the type to be stored in a collection such as an array or a dictionary, as mentioned in Procols as Types. This example creates an array of `TextRepresentable` things:
let things: [TextRepresentable] = [game, d12, simonTheHamster]
//: It is now possible to iterate over the items in the array and print each items's textual description:
for thing in things {
    print(thing.textualDescription)
}
//: Note that the `thing` constant is of type `TextRepresentable`. It not the type of `Dice`, or `DiceGame`, or `Hamster`, even if the actual instance behind the scenes is of one of those types. Nonetheless, becuase it is of type `TextRepresentable, and anyting that is `TextRepresentable` is known to have `textualDescription` property, it is safe to access `thing.textualDescription` each time through the loop.
//: Move on to [Protocol Inheritance](@next)
