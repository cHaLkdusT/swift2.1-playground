//: ## Automatic Reference Counting
/*:
Swift uses _Automatic Reference Counting_ (ARC) to track and manage your app's memory usage. In most cases, this means that memory management "just works" in Swift, and you do not need to think about memory management yourself. ARC automatically frees up the memory used by class instances when those instances no longer needed.

However, in a few cases ARC requires more information about the relationships between your parts of your code in order to manage memory for you.

Reference counting only applies to instances of classes. Structures and enumerations are value types, not reference types, and are not stored and passed by reference.
*/
//: ## How ARC Works
/*:
Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance. This memory holds information about the type of the instance, together with the values of any stored properties associated with that instance.

Additionally, when an instance is no longer need, ARC frees up the memory used by that instance so that the memory can be used for other purposes instead. This ensures that class instances do not take up space in memory when they are no longer needed.

However, if ARC were to deallocate an instance that was still in use, it would no longer be possible to access that instance's properties, or call that instance's methods. Indeed, if you tried to access the instance, your app would most likely crash.

To make sure that instances don't disappear while they are still needed, ARC tracks how many properties, constants and variables are currently referring to each class instance. ARC will not deallocate an instance as long as at least one active reference to that instance still exists.

To make this possible, whenever you assign a class instance to a property, constant or variable that property, constant, or variable makes a _strong reference_ to the instance. The reference is called a "strong" reference because it keeps a firm hold on that instance and does not allow it to be deallocated for as long as that strong reference remains.
*/
//: Move on to [ARC in Action](@next)
