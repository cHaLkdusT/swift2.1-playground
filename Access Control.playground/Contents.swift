/// ACCESS CONTROL
/// MODULES AND SOURCE FILES
/// ACCESS LEVELS
/// GUIDING PRINCIPLE OF ACCESS LEVELS
/// DEFAULT ACCESS LEVELS
/// ACCESS LEVELS FOR SINGLE-TARGET APPS
/// ACCESS LEVELS FOR FRAMEWORKS
/// ACCESS LEVELS FOR UNIT TEST TARGETS
/// ACCESS CONTROL SYNTAX
public class SomePublicClass {}
internal class SomeInternalClass {}
private class SomePrivateClass {}

public var somePublicVar = 0
internal let someInternalConstant = 0
private func somePrivateFunction() {}

class SomeInternalClass2 {} // implicitly internal
let someInternalConstant2 = 0

public class SomePublicClass2 {  // explicitly public class
    public var somePublicProperty = 0 // explicitly public class member
    var someInternalProperty = 0 // implicityly internal class member
    private func somePrivateMethod() {} // explicitly private class member
}

class SomeInternalClass3 { // implicitly internal class
    var someInternalProperty = 0 // implicitly internal class member
    private func somePrivateMethod() {} // explicitly private class member
 }

/// TUPLE TYPES
/// FUNCTION TYPES
private func someFunction() -> (SomeInternalClass, SomePrivateClass) {
    // function implementation goes here
    return (SomeInternalClass(), SomePrivateClass())
}

/// ENUMERATION TYPES
public enum CompassPoint {
    case North
    case South
    case East
    case West
}


/// RAW VALUES AND ASSOCIATED VALUES

/// NESTED TYPES

/// SUBCLASSING
public class A {
    private func someMethod() {}
}
internal class B: A {
    override func someMethod() {
        super.someMethod()
    }
}

/// CONSTANTS, VARIABLES, PROPERTIES, AND SUBSCRIPTS
private var privateInstance = SomePrivateClass()

/// GETTERS AND SETTERS
struct TrackedString {
    private(set) var numberOfEdits = 0
    var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
}
var stringToEdit = TrackedString()
stringToEdit.value = "This string will be tracked."
stringToEdit.value += " This edit will increment numberOfEdits"
stringToEdit.value += " So will this one."
print("The number of edits is \(stringToEdit.numberOfEdits)")

public struct TrackedString2 {
    public private(set) var numberOfEdits = 0
    public var value: String = "" {
        didSet {
            numberOfEdits++
        }
    }
    public init() {}
}

/// INITIALIZERS
/// DEFAULT INITIALIZERS
/// DEFAULT MEMBERWISE INITIALIZERS FOR STRUCTURE TYPES
/// PROTOCOLS
/// PROTOCOL INHERITANCE
/// PROTOCOL CONFORMANCE
/// EXTENSION
/// ADDING PROTOCOL CONFORMANCE WITH AN EXTENSION
/// GENERICS
/// TYPEALIAS