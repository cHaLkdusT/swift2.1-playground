//: Previous [The self Property](@previous)
/*:
 ## Type Methods
 Instance methods are methods that are called on an instance of a particular type. You can also define methods that are called on the type itself. These kinds of methods are called _type methods_. You indicate type methods by writing the `static` keyword before the method's `func` keyword. Classes may also use the `class` keywrod to allow subclasses to override the superclass's implementation of that method.
 
 > In Objective-C, you can define type-level methods only for Objective-C classes. In Swift, you can define type-level methods for all classes, structures, and enumerations. Each type method is explicitly scope to the type it supports.
 
 Type methods are called with dot syntax, like instance methods. However, you call the type methods on the type, not on an instance of that type.
*/
class SomeClass {
    class func someTypeMethod() {
        // type method implementation goes here
    }
}
SomeClass.someTypeMethod()
//: Any unqualified method and property names that you use within the body of a type method will refer to other type-level methods and properties. A type method can call another type method with the other method's name, without needing to prefix it with the type name. Similary, type methods on structures and enumerations can access type properties by using the type property's anme without a type name prefix.
struct LevelTracker {
    static var highestUnlockedLevel = 1
    var currentLevel = 1
    
    static func unlock(_ level: Int) {
        if level > highestUnlockedLevel {
            highestUnlockedLevel = level
        }
    }
    static func isUnlocked(_ level: Int) -> Bool {
        return level <= highestUnlockedLevel
    }
    
    @discardableResult
    mutating func advance(to level: Int) -> Bool {
        if LevelTracker.isUnlocked(level) {
            currentLevel = level
            return true
        } else {
            return false
        }
    }
}
//: The `LevelTracker` structure keeps track of the highest level that any player has unlocked. This value is stored in a type property called `highestUnlockedLevel`.
class Player {
    var tracker = LevelTracker()
    let playerName: String
    func complete(level: Int) {
        LevelTracker.unlock(level + 1)
        tracker.advance(to: level + 1)
    }
    init(name: String) {
        playerName = name
    }
}

var player = Player(name: "Argyrios")
player.complete(level: 1)
print("Highest unlocked level is now \(LevelTracker.highestUnlockedLevel)")

player = Player(name: "Beto")
if player.tracker.advance(to: 6) {
    print("Player is now on level 6")
} else {
    print("level 6 has not yet been unlocked")
}
