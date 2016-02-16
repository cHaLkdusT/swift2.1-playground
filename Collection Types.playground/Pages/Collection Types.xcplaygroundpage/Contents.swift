//: # Collection Types
/*:
Swift provide three primary _collection types_, known as arrays, sets, and dictionaries, for storing collections of values. Arrays are ordered collections of values. Sets are unordered collections of unique values. Dictionaries are unordered collections of key-value associations.

Arrays, sets and dictionaries in Swift are always clear about the types of values and keys that they can store. This means that you cannot insert a value of the wrong type into a collection by mistake. It also means you can be confident about the type of values you will retrieve from a collection.
*/
//: ## Mutability of Collections
/*:
* If you create an array, a set, or a dictionary and assign it to a variable, the collection that is created will be _mutable_
* If you assign an array, a set or a dictionary to a constant, that collection is _immutable_, aand its size and contents cannot be changed.

Good practice to create immutable collections. Doing so enables the Swift compiler to optimize the performance of the collections you create
*/
//: ## Arrays
/*:
An _array_ stores values of the same type in an ordered list. The same value can appear in an array multiple times at different positions.

Swift's `Array` type is bridge to Foundations' NSArray class
*/
//: ### Array Type Shorthand Syntax
//: The type of a Swift is written in full as `Array<Element>`, where `Element` is the type of values the array is allowed to store. You can also write the type of an array in shorthand form as `[Element]`. Although the two forms are functionally identical, the shorthand form is preferred and is used throughout this guide when referring to the type of an array.
let arr1 =  Array<String>()
let arr2 = [String]()
//: ### Creating an Empty Array
//: You can create an empty aray of a certain type using initializer syntax
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")
/*: Note that the type of the `someInts` variable is inferred to be `[Int]` from the type of the initializer

Alternatively, if the context already provides type information, such as a function argument or an already typed variable or constant, you can create an empty array with an empty array literal, which is written as `[]` (an empty pair of square brackets)
*/
someInts.append(3)
someInts = []
//: ### Creating an Array with a Default Value
//: Swift's `Array` type also provides an initializer for creating an array of a certain size with all of its values set to the same default value. You pass this initializer the number of items to be added to the new array (called `count`) and default value of the appropriate type (called `repeatedValue`)
var threeDoubles = [Double](count: 3, repeatedValue: 0.0)
//: ### Creating an Array by Adding Two Arrays Together
//*: You can create a new array by adding together two existing arrays with compatible types with the addition operator (`+`). The new array's type is inferred from the type of the two arrays you add together
var anotherThreeDoubles = [Double](count: 3, repeatedValue: 2.5)
var sixDoubles = threeDoubles + anotherThreeDoubles
//: ### Creating an Array with an Array Literal
//: You can also initialize an array with an `array literal`, which is a shorthand way to write one or more values as an array collection. An array literal is written as a list of values, separated by commas, surrounded by a pair of square brackets
var shoppingList: [String] = ["Eggs", "Milk"]
// var shoppingList = ["Eggs", "Milk"]
//: ### Accessing and Modifying an Array
//: You can access and modify an array through its methods and properties, or by using subscript syntax
print("The shopping list contins \(shoppingList.count) items.") // Find out the number of items in an array
// Use the Boolean `isEmpty` property as a shortcut for checking wheter the `count` property is equal to `0`
if shoppingList.isEmpty {
    print("The shopping list is empty")
} else {
    print("The shopping list is not empty")
}
//: You can add a new item to the end of an array by calling the array's `append(_:)` method
shoppingList.append("Flour")
//: Append an array of one or more compatible items with the addition assignment operator (`+=`)
shoppingList += ["Baking Powder"]
shoppingList += ["Chocolate Spread", "Cheese", "Butter"]
//: Retrieve a value from the array by using `subscript syntax`, passing the index of the value you want to retrieve within square brackets immediately after the name of the array
var firstItem = shoppingList[0]
//: You can use subscript syntax to change an existing value at a given index
shoppingList[0] = "Six eggs"
shoppingList
//: You can also use subscript syntax to change a range of values at once, even if the replacement set of values has a different lenght than the range you are replacing.
shoppingList[4...6] = ["Bananas", "Apples"]
shoppingList
/*: You can't use subscript syntax to append a new item to the end of an array

To insert an item into the array at a specified index, call the array's `insert(_:atIndex:) method
*/
shoppingList.insert("Maple Syrup", atIndex: 0)
shoppingList
//: You remove an item from the array with the `removeAtIndex(_:)` method. This method removes the item at the specified index and returns the removed item
let mapleSyrup = shoppingList.removeAtIndex(0)
/*: If you try to access or modify a value for an index that is outside of an array's existing bounds, you will trigger a runtime error. You can check that an index is valid vefore using it by comparing it to the array's `count` property. Except when `count` is `0` (meaning the array is empty), the largert valid index in an array will always be `count - 1`, because arrays are indexed from zero

Any gaps in an array are closed when an item is removed
*/
firstItem = shoppingList[0]
//: If you want to remove the final item in an array, use the `removeLast()` method rather thatn 
let apples = shoppingList.removeLast()
//: ### Iterating Over an Array
for item in shoppingList {
    print(item)
}
//: If you need the integer index of each item as well as its value, use the `enumerate()` method to iterate over the array instead. For each item in the array, the `enumerate()` method returns tuple composed of the index and the value for that item.
for (index, value) in shoppingList.enumerate() {
    print("Item \(index + 1): \(value)")
}
//: Move on to [Sets](@next)
