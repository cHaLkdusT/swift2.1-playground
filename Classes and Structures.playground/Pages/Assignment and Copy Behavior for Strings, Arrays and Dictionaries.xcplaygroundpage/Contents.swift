//: Previous [Choosing Between Classes and Structures](@previous)
/*: 
 ## Assignment and Copy Behavior for Strings, Arrays and Dictionaries
 In Swift, many basic data types such as `String`, `Array`, and `Dictionary` are implemented as structures. This measn that the data such as strings, arrays, and dictionaries are copied when they are assigned to a new constant or variable, or when they are passed to a function or method.
 
 This behavior is different from Foundation: `NSString`, `NSArray` and `NSDictionary` are implemented as classes, not structures. Strings, arrays and dicionaries in Foundation are always assigned and passed arround as a reference to an existing instance, rather than as a copy.
 
 > The description above refers to the "copying" of strings, arrays and dictionaries. The behavior you see in your code will always be as if a copy took place. However, Swift only performs an _actual_ copy behind the scenes when it is absolutely necessary to do so. Swift manages all value copying to ensure optimal performance, and you should not avoid assignment to try to preempt this optimization.
*/
