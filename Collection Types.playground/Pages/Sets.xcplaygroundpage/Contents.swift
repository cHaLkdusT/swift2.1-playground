//: Previous [Collection Types](@previous)
//: ## Sets
/*: 
 A _set_ stores distinct values of the same type in a collection with no defined ordering. You can use a set instead of an array when the order of items is not important, or when you need to ensure that an item only appears once.

 > NOTE: Swift Set type is bridged to Foundation's NSSet class
*/
//: ### Hash Values for Set Types
/*:
 A type must be _hashable_ in order to be stored in a set -- must provide _hash value_ for itset. A hash value is an `Int` value that is the same for all objects that compare equally, such that if `a == b`, it follows that `a.hashValue = b.hasValue`

 All of Swift's basic types (such as `String`, `Int`, `Double` and `Bool`) are hashable by default, and can be used as set value types or dictionary key types. Enumeration case values without associated values are also hashable by default.

 > NOTE: You can use your own custom types as set value types or dictionary key types by making them conform to the `Hashable` protocol from Swift's standard library. Types that conform to the `Hashable` protocol must provide a gettable `Int` property called `hashValue`. The value returned by a type's `hashValue` property is not required to be the same across different executions of the same program, or in different programs. Because `Hashable` protocol conforms to `Equatable`, conforming types must also provide an implementation of the "is equal" operator (`==`)

* a == a (Reflexivity)
* a == b implies b == a (Symmetry)
* a == b && b == c implies a == c (Transivity)
*/

//: ### Set Type Syntax
//: The type of a Swift set is written as `Set<Element>`, where `Element` is the type that the set is allowed to store. Sets do not have equivalent shorthand form, unlike arrays

//: ### Creating and Initializing an Empty Set
var letters = Set<Character>()
print("Letters is of type Set<Character with \(letters.count) items.")
//: > NOTE: If the context already provides type information, you can create an empty set with an empty array literal
letters.insert("a")
letters = []

//: ### Creating a Set with an Array Literal
//: You can initialize a set with an array literal, as shorthand way to write one or more values as a set collection
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]
//: A set type cannot be inferred from an array literal alone, so the type `Set` must be explicitly declared. However, because of Swift's type inference, you don't have to write the type of the set if you're initializing it with an array literal containing values of the same type
var inferredSet: Set = ["Rock", "Classical", "Hip hop"]

//: Accessing and Modifying a Set
//: To find out the number of the items in a set, check its read-only `count` property
print("I have \(favoriteGenres.count) favorite music genres.")

//: Use the Boolean `isEmpty` property as a shortcut for checking wheter the `count` property is equal to `0`
if favoriteGenres.isEmpty {
    print("As far a music goes, I'm not picky")
} else {
    print("I have a particular music preferences.")
}

//: You can add new item into a set by calling the set's `insert(_:)` method
favoriteGenres.insert("Jazz")

//: You can remove an item from a set by calling the set's `remove(_:)` method, which removes the item if it's a member of the set, and returns the removed value, or returns nil if the set did not contain it. Alternatively, all items in a set can be removed with its `removeAll()` method.
if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that")
}

//: To check whether a set contains a particular item, use the `contains(_:)` method
if favoriteGenres.contains("Funk") {
    print("I get up on the good foot.")
} else {
    print("It's too funky in here.")
}

//: ### Iterating Over a Set
//: You can iterate over the values in a set with a `for-in` loop
for genre in favoriteGenres {
    print("\(genre)")
}
//: Switf's `Set` type does not have a defined ordering. To iterate over the values of a set in a specific order, use the `sort()` method, which returns the set's element as an array sorted using the `<` operator
for genre in favoriteGenres.sorted() {
    (genre)
}

//: ## Performing Set Operations
//: You can efficiently perform fundamental set operations, such as combining two sets together, determining which values two sets have in common, or determining whether two sets contain all, some or non of the same values

//: ### Fundamental Set Operations
//: ![Venn Diagram](setVennDiagram_2x.png "Venn Diagram")
/*:
* `intersection(_:)` method to create a new set with only the values common to both sets
* `symmetricDifference(_:)` method to create a new set with values in either set, but not both
* `union(_:)` method to create a new set with all of the values in both sets
* `subtracting(_:)` method to create a new set with values not in the specifie set.
*/
let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.intersection(singleDigitPrimeNumbers).sorted()
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
oddDigits.union(evenDigits).sorted()
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()

//: ### Set Membership and Equality
//: Set `a` is a _superset_ of a set `b`. Conversely, set `b` is a _subset_ of set `a`, because all elements in `b` are also contained by `a`. Set `b` and `c` are _disjoint_ with one another, because they share no elements in commont
//: ![Euler Diagram](setEulerDiagram_2x.png "Euler Diagram")
/*:
* "is equal" operator (`==`) to determine whether two sets contain all of the same values
* `isSubset(of:)` method to determine whether all of the values of a set are contained in the specified set
* `isSuperset(of:)` method to determin whether a set contains all of the values in a specified set
* `isStrictSubset(of:)` or `isStrictSupersetOf(_:)` methods to determine whether a set is a subtset or superset, but not equal to, a specified set
* `isDisjoint(with:)` method to determine wheter two sets have any values in commont
*/
let houseAnimals: Set = ["🐶", "🐱"]
let farmAnimals: Set = ["🐮", "🐔", "🐑", "🐶", "🐱"]
let cityAnimals: Set = ["🐦", "🐭"]

houseAnimals.isSubset(of: farmAnimals)
farmAnimals.isSuperset(of: houseAnimals)
farmAnimals.isDisjoint(with: cityAnimals)
//: Move on to [Dictionaries](@next)
