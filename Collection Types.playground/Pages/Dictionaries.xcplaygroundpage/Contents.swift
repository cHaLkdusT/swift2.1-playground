//: Previous [Sets](@previous)
//: ## Dictionaries
/*:
 A _dictionary_ stores associations between keys of the same type and values of the same type in a collection with no defined ordering. Each value is associated with a unique `key`, which acts as an identifier for that value within the dictionary. Unlike items in an array, items in a dictionary do not have specified order. You use a dictionary when you need to look up values based on their identifier, in much the same way that a real-worl dictionary is used to look up the definition for a particular word.

 > It is bridged to Foundation's NSDictionary class
*/

//: ### Dictionary Type Shorthand Syntax
/*: 
 The type of a Swift dictionary is written in ful as `Dictionary<Key, Value>` where `Key` is the type of value that can be used as a dictionary key, and the `Value` is the type of value that the dictionary stores for those keys

 > Dictionary Key type must conform to the Hashable protocol, like a set's value type

 You can write the type of a dictionary in shorthand form as `[Key: Value]`.
*/
Dictionary<Int, String>()
[Int: String]()

//: ### Creating an Empty Dictionary
//: As with array,s you can create an empty `Dictionary` of a certain type by using initializer syntax
var namesOfIntegers = [Int: String]()

//: If the context already provides type information, you can create an empty dictionary with an empty dictionary literal, which is written as `[:]`
namesOfIntegers[16] = "sixteen"
namesOfIntegers = [:]

//: ### Creating a Dictionary with a Dictionary Literal
/*:
You can also initialize a dictionary with a _dictionary literal_, which has a similar syntax to the array literal seen earlier. 

A _key-value pair_ is a combination of a key and a value. In a dictionary literal, the key and value in each key-value pair are separated by a colon.
*/
var airports: [String: String] = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]
var implicityAirports = ["YYZ": "Toronto Pearson", "DUB": "Dublin"]

//: ### Accessing and Modifying a Dictionary
//: You find out the number of items in a `Dictionary` by checking its read-only `count` property
print("The airpots dictionary contains \(airports.count) items.")

//: Use the Boolean `isEmpty` property as a shortcut for checking whether the `count` is equal to `0`
if airports.isEmpty {
    print("The airports dictionary is empty")
} else {
    print("The airports dictionary is not empty")
}

//: You add a new item with subscript syntax. Use a new key of the appropriate type as the subscript index, and assign a new value of the appropriate type
airports["LHR"] = "London"

//: You use subscript syntax to change the value associated with a particular key
airports["LHR"] = "London Heathrow"

//: Use dictionary's `updateValue(_:forKey:)` method to set or update the value for a particular key. Unlike subscript, however, the `updateValue(_:forKey:)` method returns the _old_ value after performing an update
if let oldValue = airports.updateValue("Dublin Airport", forKey: "DUB") {
    print("The old value for DUB was \(oldValue)")
}

//: Because it is possible to request a key for which no value exists, a dictionary's subscript returns an optional value fo the dictionary's value type.
if let airportName = airports["DUB"] {
    print("The name of the airport is \(airportName)")
} else {
    print("That airport is not in the airports dictionary")
}

//: You use subscript syntax to remove a key-value pair from a dictionary by assigning a value of `nil` for that key
airports["APL"] = "Apple International"
airports
airports["APL"] = nil
airports
//: Alternatively, remove a key-value pari form a dictionary with the `removeValueForKey(_:)` method. This method removes the key-value pair if it exists and returns the removed value, or returns `nil` if no value existed
if let removedValue = airports.removeValue(forKey: "DUB") {
    print("The removed airport's name is \(removedValue)")
} else {
    print("The airports dictionary does not contain a value for DUB")
}

//: ### Iterating Over a Dictionary
//: You can iterate over the key-value pairs in a dictionary with a `for-in` loop. Each item in the dictionary is returned as `(key, value)` tuple, and you can decompose the tuple's member into temporary constants as part of the iteration
for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

//: You can retrieve an iterable collection of a dictionary's keys or values by accessing its `keys` and `values` properties
for airportCode in airports.keys {
    print("Airport code: \(airportCode)")
}

for airportName in airports.values {
    print("Airport name: \(airportName)")
}

//: If you need to use a dictionary's keys or values with an API that takes an `Array` instance, initialize a new array with the `keys` or `values` property
let airportCodes = [String](airports.keys)
let airportNames = [String](airports.values)

//: Swift's `Dictionary` type does not have a defined ordering. To iterate over the keys or values of a dictionary in a specific order, use the `sort()` method on its `keys` or `values` property
