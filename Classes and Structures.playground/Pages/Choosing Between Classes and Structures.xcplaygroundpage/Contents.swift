//: Previous [Classes Are Reference Types](@previous)
//: Choosing Between Classes and Strucutures
/*:
As a general guideline, consider creating a structure when one or more of these conditions apply:
* The structure's primary purpose is to encapsulate a few relatively simple data values
* It is reasonable to expect that the encapsulated values wil be copied rather than referenced when you assign or pass around an instance of that structure
* Any properties stored by the structure are themselves value types, which would also be expected to be copied rather than referenced
* The structure does not need to inherit porperties or behavior from another existing type

Examples of good candidates for structures include:
* The size of a geometric shape, perhaps encapsulating a `width` property and a `height` property, both of type `Double`
* A way to refer to ranges within a series, perhaps encapsulating a `start` property and a `length` property, both of type `Int`
* A point in a 3D coordinate system, perhaps encapsulating `x`, `y` and `z` properties, each of type `Double`
*/
//: Move on to [Assignment and Copy Behavior for Strings, Arrays and Dictionaries](@next)