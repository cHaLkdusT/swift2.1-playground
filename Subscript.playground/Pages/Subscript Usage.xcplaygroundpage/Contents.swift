//: Previous [Subscripts](@previous)
/*:
 ## Subscript Usage
 The exact meaning of "subscript" depends on the context in which it is used. Subscripts are typically used as a shortcut for accessing the member elements in a collection, list, or sequence. You are free to implement subscripts in the most appropriate way for you particular class or structure's functionality.
 
 For example, Swift's `Dictionary` type implements a subscript to set and retrieve the values stored in a `Dictionary` instance. You can set a value in a dictionary by providing a key of the dictionary's key type within subscript brackets and assigning a value of the dictionary's value type to the subscript
*/
var numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
numberOfLegs["Bird"] =  2
//: > Swift's `Dictionary` type implements its key-value subscripting as a subscript that takes and returns an _optional_ type. For the `numberOfLegs` dictionary above, the key-value subscript takes and returns a value of type `Int?` or "optional int". The `Dictionary` type uses an optional subscript type to model the fact taht not every key will have a value, and to give a way to delete a value for a key by assigning a `nil` value for that key.
//: Move on to [Subscript Options](@next)
