/// ERROR HANDLING
/// REPRESENTING ERRORS
enum VendingMachineError: ErrorType {
    case InvalidSelection
    case InsufficientFunds(centsNeeded: Int)
    case OutOfStock
}

//func canThrowErrors() throws -> String
//func cannotThrowErrors() -> String

struct Item {
    var price: Int // cents
    var count: Int
}

var inventory = [
    "Candy Bar": Item(price: 125, count: 7),
    "Chips": Item(price: 100, count: 4),
    "Pretzels": Item(price: 75, count: 11)
]

var amountDeposited = 100

func vend(itemNamed name: String) throws {
    guard var item = inventory[name] else {
        throw VendingMachineError.InvalidSelection
    }
    guard item.count > 0 else {
        throw VendingMachineError.OutOfStock
    }
    if amountDeposited >= item.price {
        // Dispense the snakc
        amountDeposited -= item.price
        --item.count
        inventory[name] = item
    } else {
        let amountNeeded = item.price - amountDeposited
        throw VendingMachineError.InsufficientFunds(centsNeeded: amountNeeded)
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob" : "Licorice",
    "Eve" : "Pretzels"
]

func buyFavoriteSnack(person: String) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vend(itemNamed: snackName)
}

/// CATCHING AND HANDLING ERRORS
do {
    try vend(itemNamed: "Candy Bar")
    // Enjoy delicious snak
} catch VendingMachineError.InvalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.OutOfStock {
    print("Out of Stock.")
} catch VendingMachineError.InsufficientFunds(let amountNeeded) {
    print("Insufficient funds. Please insert an additional \(amountNeeded) cents.")
}

/// DISABLING ERROR PROPAGATION
//func willOnlyThrowIfTrue(value: Bool) throws {
//    if value { throw someError }
//}
//do {
//    try willOnlyThrowIfTrue(false)
//} catch {
//    // Handle error
//}

//try! willOnlyThrowIfTrue(false)


/// SPECIFYING CLEAN-UP ACTIONS
//func processFile(filename: String) throws {
//    if exists(filename) {
//        let file = open(filename)
//        defer {
//            close(file)
//        }
//        while let line = try file.readLine() {
//            // work with the file.
//        }
//        // close(file) is called here, at the end of the scope.
//    }
//}