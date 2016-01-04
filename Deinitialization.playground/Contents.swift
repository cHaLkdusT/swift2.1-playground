/// DEINITIALIZATION
/// HOW DEINITIALIZATION WORKS
/// DEINITIALIZERS IN ACTION
class Bank {
    static var coinsInBank = 10_000
    static func vendCoins(var numberOfCoinToVend: Int) -> Int {
        numberOfCoinToVend = min(numberOfCoinToVend, coinsInBank)
        coinsInBank -= numberOfCoinToVend
        return numberOfCoinToVend
    }
    static func receivedCoins(coins: Int) {
        coinsInBank += coins
    }
}

class Player {
    var coinsInPurse: Int
    init(coins: Int) {
        coinsInPurse = Bank.vendCoins(coins)
    }
    func winCoins(coins: Int) {
        coinsInPurse += Bank.vendCoins(coins)
    }
    deinit {
        Bank.receivedCoins(coinsInPurse)
    }
}

var playerOne: Player? = Player(coins: 100)
print("A new player has joined the game with \(playerOne!.coinsInPurse) coins")
print("There are now \(Bank.coinsInBank) coins left in the bank")
playerOne!.winCoins(2_000)
print("PlayerOne won 200 coins & now has \(playerOne!.coinsInPurse) coins")
print("The bank now only has \(Bank.coinsInBank) coins left")
playerOne = nil
print("PlayerOne has left the game")
print("The bank now has \(Bank.coinsInBank)")