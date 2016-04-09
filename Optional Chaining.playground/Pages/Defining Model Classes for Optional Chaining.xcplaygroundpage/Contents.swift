//: [Previous](@previous)
// ## Defining Model Classes for Optional Chaining
/*:
 You use optional chaining with calls to properties, methods and subscripts that are more than one level deep. This enables you to drill down into subproperties within complex models of interrelated types, and to check whether it is possible to access properties, methods and subscripts on those subproperties.
 
 The code snippets below define four model classes for use in several subsequent examples, including examples of multilevel optional chaining These classes expand upon the `Person` and `Residence` model from above by adding a `Room` and `Address` class, with associated properties, methods and subscripts.

 The `Person` class is defined in the same way as before:
 */
class Person {
    var residence: Residence?
}
//: The `Residecne` class is more complex than before. This time, the `Residence` class defines a variable property called `rooms`, which is initialized with an empty array of type `[Room]`
class Residence {
    var rooms = [Room]()
    var numberOfRooms: Int {
        return rooms.count
    }
    subscript(i: Int) -> Room {
        get {
            return rooms[i]
        }
        set {
            rooms[i] = newValue
        }
    }
    func printNumberOfRooms() {
        print("The number of rooms is \(numberOfRooms)")
    }
    var address: Address?
}
/*:
 Because of this version of `Residence` stores an array of `Room` instances, its `numberOfRooms` property is implemented as a computed property, not a stored property. The computed `numberOfRooms` property simply returns the value of the `count` property from the `rooms` array.
 
 As a shortcut to accessing its `rooms` array, this version of `Residence` provides a read-write subscript that provides access to the room at the reqeust index in the `rooms` array.
 
 This version of `Residence` also provides a method called `printNumberOfRooms`, which simply prints the number of rooms in the residence.
 
 Finally, `Residence` defines an optional property called `address`, with a type of `Address?`. The `Address` class type for this property is defined below:
 */
class Room {
    let name: String
    init(name: String) { self.name = name }
}
//: This class has three optional properties of type `String?`. The first two proeprties, `buildingName` and `buildingNumber, are alternative ways to identify a particular building as part of an address. The third property, `street`, is used to anme the street for that address:
class Address {
    var buildingName: String?
    var buildingNumber: String?
    var street: String?
    func buildingIdentifier() -> String? {
        if buildingName != nil {
            return buildingName
        } else if buildingNumber != nil && street != nil {
            return "\(buildingNumber) \(street)"
        } else {
            return ""
        }
    }
}
//: The `Address` class also provides a method called `buildingIdentifier()`, which has return type of `String?`. This method checks the properties of the address and returns `buildingName` if it has a value, or `buildingNumber` concatenated with `streeet` if both have values, or `nil` otherwise
//: ## Accessing Properties Through Optional Chaining
let john = Person()
if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}
//: Because `john.residence` is `nil`, this optional chaining call failes in the same way as before. You can also attempt to set a property's value through optional chaining
let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
john.residence?.address = someAddress
/*:
 In this example, the attempt to set the `address` property of `john.residence` will fail, because `john.residence` is currently `nil`.
 
 The assignment is part of the optional chaining, which means none of the code on the right hand side of the `=` operator is evaluated. In the previous examples, it's not easy to see that `someAddress` is never evaluated, because accessing the constant desont' have any side effect. The listing below does the same assignmetn, but it uses a function to created the address. The function prints "Function was called" before returning a value, which lests you see whether the right hand side of the `=` operator was evaluated
 */
func createAddress() -> Address {
    print("Function was called.")
    let someAddress = Address()
    someAddress.buildingName = "29"
    someAddress.street = "Acacia Road"
    return someAddress
}
john.residence?.address = createAddress()
//: You can tell the `createAddress()` function isn't called, because nothing is printed.
//: ### Calling Methods Through Optional Chaining
/*:
 You use optional chaining to call a method on an optional value, and to check whether that method call is successful. You can do this even if that method does not define a return value.
 
 The `printNumberOfRooms()` method on the `Residence` class prints the current value of `numberOfRooms`.
 
 This method does not specify a return type. However, functions and methdos with no return type have an implicity return value of `Void` as described in Functions Without Return Values. This means that they return a value `()` or an empty tuple
 
 If you call this method on an optional value with optional chaining, the method's return type will be `Void?` not `Void`, because return values are always of an optional type when called through optional chaining. This enables you to use an `if` statement to check wheter it was possible to call the `printNumberOfRooms()` method, even though the method does not itself define a return value. Compare the value from the `printNumberOfRooms` call against `nil` to see if the method call was successful:
 */
if john.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}
//: The same is true if you attempt to set a property through optional chaining. The example above in Accessing Properties Through Optional Chaining attempts to set an `address` value for `john.residence`, even though the `residence` property is `nil`. Any attempt to set a property through optional chaining returns a value of type `Void?`, which enables you to compare against `nil` to see if the property was set successfully:
if (john.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possible to set the address")
}
// ### Accessing Subscripts Through Optional Chaining
/*:
 You can use optional chaining to try to retrieve the set a value from a subscript on an optional value, and to check that subscript call is successful.
 
 When you access a subscript on an optional value through optional chaining, you place the question mark _before_ the subscripts's brackets, not after. The optional chaining mark always follows immediately after the part of the expression that is optional
 
 The example below tries to retrieve the name of the first room in the `rooms` array of the `john.residence` property using the subscript defined on the `Residence` class. Because `john.residence` is currently `nil`, the subscript call fails.
 */
if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name")
}
/*:
 The optional chaining question mark in this subscript call is placed immediately after `john.residence`, before the subscript brackets, because `john.residence` is the optional value on which optional chaining is being attempted.
 
 Similary, you can try to set a new value throught a subscript with optional chaining:
 */
john.residence?[0] = Room(name: "Bathroom")
/*:
 This subscript setting attemptt also fails, because `residence` is currently `nil`.
 
 If you create and assign an actual `Residence` instance to `john.residence`, with one or more `Room` instances in its `rooms` array, you can use the `Residence` subscript to access the actual items in the `rooms` array through optional chaining
 */
let johnsHouse = Residence()
johnsHouse.rooms.append(Room(name: "Living Room"))
johnsHouse.rooms.append(Room(name: "Kitchen"))
john.residence = johnsHouse

if let firstRoomName = john.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room  name")
}
//: ### Accessing Subscripts of Optional Type
//: If the subscript returns a value of optional type-such as the key subscript of the Swift's `Dictionary` type-place a question mark _after_ the subscript's closing brackets to chain its optional return value:
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0] += 1
testScores["Brian"]?[0] = 72
testScores
//: The example above defines a dictionary called `testScores`, which contains two key-value pairs that map a `String` key to an array of `Int` values. The example uses optional chaining to set the first item in the `"Dave"` array to `91`; to increment the first item in `"Bev"` array by `1`; and to try to set the first item in an array for key of `"Brian"`. The first two calls succeed, because the `testScores` dictionary contains keys for `"Dave"` and `"Bev"`. The call fails, because the `testScores` dictionary does not contain a key for `"Brian"`.
//: ### Linking Multiple Levels of Chaining
/*:
 You can link together multiple levels of optional chaining to drill down to properties, methods and subscripts deeper within a model. However, multiple leves of optional chaining do not add more levels of optionality to the returne value.
 
 To put it another way:
 * If the type you are trying to retrieve is not optional, it will become optional because of the optional chaining.
 * If you are trying to retrieve is _already_ optional, it will not become _more_ optional because of the chaining.
 
 Therefore:
 * If you try to retrieve an `Int` value through optional chaining an `Int?` is always returned, no matter how many levels of chaining are used.
 * Similarly, if you try to retrieve an `Int?` value through optional chaining, an `Int?` is always returned, no matter how many levels of chaining are used.
 
 The example below tries to access the `street` property of the `address` property of the `residence` property of `john`. There are _two_ levels of optional chaining in use here, to chain through the `residence` and `address` properties, both of which are optional type:
 */
if let doesStreet = john.residence?.address?.street {
    print("John's street name is \(doesStreet)")
} else {
    print("Unable to retrieve the address")
}
/*:
 The value of `john` residence` currently contains a valid `Residence` instance. However, the value of `john.residence.address` is currently `nil`. Because of this, the call to `john.residence?.address?.street` fails.
 
 Note that in the example above, you are trying to retrieve the value of the `street` property. The type of this property is `String?`. The return value of the `john.residence?.address?.street` is therefore also `String?`, even though two levels of optional chaining are applied in addition to the underlying optional type of the property.
 
 If you set an actual `Address` instance as the value for `john.residence.address`, and set an actual value for the address's `street` property, you can access the value of the `street` property though multilevel optional chaining:
 */

let doesAddress = Address()
doesAddress.buildingName = "The Larches"
doesAddress.street = "Laurel Streent"
john.residence?.address = doesAddress

if let doesStreet = john.residence?.address?.street {
    print("John's street name is \(doesStreet)")
} else {
    print("Unable to retrieve the address.")
}
/*:
 In this example, the attempt to set the `address` property of `john.residence` will succeed, because the value of `john.residence` currently contains a valid `Residence` instance.
 
### Chaining on Methods with Optional Return Values
 The previous example shows how to retrieve the value of a property of optional type through optional chaining. You can also use optional chaining to call a method that returns a value of optional type,and to chain on that method's return value if needed.
 
 The example below calls the `Address` class's `buildingIdentifier()` method through optional chaining. This method returns a value of type `String?`. As described above, the ultimate return type of this method call after optional chaining is also `String?`:
 */
if let buildingIdentifier = john.residence?.address?.buildingIdentifier() {
    print("John's building identifier is \(buildingIdentifier)")
}
//: If you want to perform further optional chaining on this method's return value, place the optional chaining question mark _after_ the method's paretheses:
if let beginsWithThe = john.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("John's building identifier begins with \"The\".")
    } else {
        print("John's building identifier does not begin with \"The\".")
    }
}
//: In the example above, you place the optional chaining question mark _after_ the paretheses, because the optional value you are chaining on is the `buildingIdentifier()` method's return value, and not the `buildingIdentifier()` method itself.

