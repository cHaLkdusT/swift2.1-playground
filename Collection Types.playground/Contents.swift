/// COLLECTION TYPES
/// MUTABILITY OF COLLECTIONS
// var - mutable
// let - immutable
// Good practice to create immutable collections. Doing so enables the Swift compiler to optimize the performance of the collections you create

/// ARRAYS
// Bridge to Foundations' NSArray class

/// ARRAY TYPE SHORTHAND SYNTAX
Array<String>()
[String]()

/// CREATING AN EMPTY ARRAY
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
someInts.append(3)
someInts = []

/// CREATING AN ARRAY WITH A DEFAULT VALUE
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)

/// CREATING AN ARRAY BY ADDING TWO ARRAYS TOGETHER
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles

/// CREATING AN ARRAY WITH AN ARRAY LITERAL
var shoppingList = ["Eggs", "Milk"]

/// ACCESS AND MODIFYING AN ARRAY
print("The shopping list contins \(shoppingList.count) items.")

if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}

shoppingList.append("Flour")
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]

var firstItem = shoppingList[0]
shoppingList[0] = "Six eggs"
shoppingList

shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList

shoppingList.insert("Maple Syrup", atIndex: 0)
let mapleSyrup = shoppingList.removeAtIndex(0)
firstItem = shoppingList[0]

let apples = shoppingList.removeLast()

/// ITERATING OVER AN ARRAY
for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}

/// SETS
// Swift Set type is bridged to Foundation's NSSet class

/// HASH VALUES FOR SET TYPES
// A type must be hashable in order to be stored in a set -- must provide hash value
// eg String, Int, Double, Bool
// a == a (Reflexivity)
// a == b implies b == a (Symmetry)
// a == b && b == c implise a == c (Transivity)

/// SET TYPE SYNTAX
var letters = Set<Character>()
print("Letters is of type Set<Character with \(letters.count) items.")
letters.insert("a")
letters = []

/// CREATING A SET WITH AN ARRAY LITERAL
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
var inferredSet: Set = ["Rock", "Classical", "Hip hop"]

/// ACCESSING AND MODIFYING A SET
print("I have \(favoriteGenres.count) favorite music genres.")

if favoriteGenres.isEmpty {
    print("As far a music goes, I'm not picky")
} else {
    print("I have a particular music preferences.")
}

favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

/// ITERATING OVER A SET
for genre in favoriteGenres {
    print("\(genre)")
}

for genre in favoriteGenres.sort() {
    print(genre)
}

/// PERFORMING SET OPERATIONS
/// FUNDAMENTAL SET OPERATIONS

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.intersect(singleDigitPrimeNumbers).sort()
oddDigits.exclusiveOr(singleDigitPrimeNumbers).sort()
oddDigits.union(evenDigits).sort()
oddDigits.subtract(singleDigitPrimeNumbers).sort()

/// SET MEMBERSHIP AND EQUALITY
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubsetOf(farmAnimals)
farmAnimals.isSupersetOf(houseAnimals)
farmAnimals.isDisjointWith(cityAnimals)

/// DICTIONARIES
// It is bridged to Foundation's NSDictionary class

/// DICTIONARY TYPE SHORTHAN SYNTAX
// Dictionary Key type must conform to the Hashable protocol, like a set's value type
Dictionary<Int, String>()
[Int: String]()

/// CREATING AN EMPTY DICTIONARY
var namesOfIntegers = [Int: String]()

namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

/// CREATING A DICTIONARY WITH A DICTIONARY LITERAL
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var implicityAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

/// ACCESSING AND MODIFYING A DICTIONARY
print("The airpots dictionary contains \(airports.count) items.")

if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"

if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}

airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports

if let removedValue = airports.removeValueForKey("DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)