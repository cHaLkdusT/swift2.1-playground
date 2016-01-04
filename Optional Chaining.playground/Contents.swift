/// OPTIONAL CHAINING
/// OPTIONAL CHAING AS AN ALTERNATIVE TO FORCED UNWRAPPING
class Person0 {
    var residence: Residence0?
}
class Residence0 {
    var numberOfRooms = 1
}
let john = Person0()
//let roomCount = john.residence!.numberOfRooms

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

john.residence = Residence0()

if let roomCount = john.residence?.numberOfRooms {
    print("John's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}


/// DEFINING A MODEL CLASSES FOR OPTIONAL CHAINING
class Person {
    var residence: Residence?
}
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
class Room {
    let name: String
    init(name: String) {
        self.name = name
    }
}
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

/// ACCESSING PROPERTIES THROUGHT OPTIONAL CHAINING
let doe = Person()
if let roomCount = doe.residence?.numberOfRooms {
    print("Doe's residence has \(roomCount) room(s).")
} else {
    print("Unable to retrieve the number of rooms.")
}

let someAddress = Address()
someAddress.buildingNumber = "29"
someAddress.street = "Acacia Road"
doe.residence?.address = someAddress

/// CALLING METHOD THROUGH OPTIONAL CHAINING
if doe.residence?.printNumberOfRooms() != nil {
    print("It was possible to print the number of rooms.")
} else {
    print("It was not possible to print the number of rooms.")
}

if (doe.residence?.address = someAddress) != nil {
    print("It was possible to set the address")
} else {
    print("It was not possible to set the address")
}

/// ACCESSING SUBSCRIPTS THROUGH OPTIONAL CHAINING
if let firstRoomName = doe.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room name")
}

doe.residence?[0] = Room(name: "Bathroom")

let doesHouse = Residence()
doesHouse.rooms.append(Room(name: "Living Room"))
doesHouse.rooms.append(Room(name: "Kitchen"))
doe.residence = doesHouse

if let firstRoomName = doe.residence?[0].name {
    print("The first room name is \(firstRoomName)")
} else {
    print("Unable to retrieve the first room  name")
}

/// ACCESSING SUBSCRIPTS OF OPTIONAL TYPE
var testScores = ["Dave": [86, 82, 84], "Bev": [79, 94, 81]]
testScores["Dave"]?[0] = 91
testScores["Bev"]?[0]++
testScores["Brian"]?[0] = 72
testScores

/// LINKIN MULTIPLE LEVELS OF CHAINING
if let doesStreet = doe.residence?.address?.street {
    print("Doe's street name is \(doesStreet)")
} else {
    print("Unable to retrieve the address")
}

let doesAddress = Address()
doesAddress.buildingName = "The Larches"
doesAddress.street = "Laurel Streent"
doe.residence?.address = doesAddress

if let doesStreet = doe.residence?.address?.street {
    print("Doe's street name is \(doesStreet)")
} else {
    print("Unable to retrieve the address.")
}

/// CHAINING ON METHODS WITH OPTIONAL RETURN VALUES
if let buildingIdentifier = doe.residence?.address?.buildingIdentifier() {
    print("Doe's building identifier is \(buildingIdentifier)")
}

if let beginsWithThe = doe.residence?.address?.buildingIdentifier()?.hasPrefix("The") {
    if beginsWithThe {
        print("Doe's building identifier begins with \"The\".")
    } else {
        print("Doe's building identifier does not begin with \"The\".")
    }
}