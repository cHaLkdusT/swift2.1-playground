//: Previous [Objects and Classes](@previous)
/*:
 ## Enumerations and Structures
 Use `enum` to create an enumeration. Like classes and all other named types, enumerations can have methods associated with them.
 */
enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDesction() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
//: **Experiment** Write a function that compares two `Rank` values by comparing their raw values

/*:
 By defaul, Swift assigns the raw values at zero and incrementing by one each time, but you can change this behavior by explicitly specifying values. In the example above, `Ace` is explicitly give a raw value of `1`, and the rest of the raw values are assigned in order. You can also use strings or floating-point numbers as raw type of an enumeration. Use the `rawValue` property to access the raw value of an enumeration case.
 
 Use the `init?(rawValue: )` initializer to make an instance of an enumeration from a raw value.
 */
if let convertedRank = Rank(rawValue: 3) {
    let threeDescription = convertedRank.simpleDesction()
}

//: The case values of an enumeration are actual values, not just another way of writing their raw values. In fact, in cases where there isn't a meaningful raw value, you don't have to provide one.
enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
//: **Experiment** Add a `color()` method to `Suit` that returns "black for spades and clubs, and returns "red" for hearts and diamonds

/*:
 Notice the two ways that the `hearts` case of the enumeration is referred to above: When assigning a value to the `hearts` constant, the enumeration case `Suit.hearts` is referred to by its full name because the contant doesn't have an explicity type specified. Inside the switch, the enumeration is referred to by the abbreviated form `.hearts` because the value of `self` is already known to be a suit. You can use the abbreviated form anytime the value's type is already known.
 
 Use `struct` to create a structure. Structures support many of the same behaviors as classes, including methods and initializers. One of the most important differences between structures and classes is that structures are always copied when they are passed around in your code, but classes are passed by reference.
 */
struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "The \(rank.simpleDesction()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
//: **Experiment** Add a method to `Card` that creates a full deck of cards, with one card of each combination of rank and suit.

/*:
 An instance of an enumeration case can have values associated with the instance. Instances of the same enumeration case can have different values associated with them. You provide the associated values when you create the instance. Associated values and raw values are different: The raw value of an enumeration case is the same for all of its instances, and you provide the raw value when you define the enumeration.
 
 For example, consider the case of requesting the sunrise and sunset time from a server. The server either responds with the information or it responds with some error information.
 */
enum ServerResponse {
    case result(String, String)
    case failure(String)
}
let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")

switch success {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
}
//: **Experiment** Add a third case to `ServerResponse` and to the switch

//: Notice how the sunrise and sunset times are extracted from the `ServerResponse` value as part of matching the value against the switch cases.
//: Next [Protocols and Extensions](@next)
