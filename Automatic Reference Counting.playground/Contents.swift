/// AUTOMATIC REFERENCE COUNTING
/// ARC IN ACTION
class Person {
    let name: String
    init(name: String) {
        self.name = name
        print("\(name) is being initialized")
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var reference1: Person?
var reference2: Person?
var reference3: Person?
reference1 = Person(name: "John Appleseed")
reference2 = reference1
reference3 = reference1

reference1 = nil
reference2 = nil
reference3 = nil

/// STRONG REFERENCE CYCLES BETWEEN CLASS INSTANCES
class Person1 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment1?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment1 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    var tenant: Person1?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john: Person1?
var unit4a: Apartment1?
john = Person1(name: "John Appleseed")
unit4a = Apartment1(unit: "4A")

john!.apartment = unit4a
unit4a!.tenant = john

// Strong reference
john = nil
unit4a = nil

/// RESOLVING STRONG REFERENCE CYCLES BETWEEN CLASS INTANCES
/// WEAK REFERENCES
class Person2 {
    let name: String
    init(name: String) {
        self.name = name
    }
    var apartment: Apartment2?
    deinit {
        print("\(name) is being deinitialized")
    }
}
class Apartment2 {
    let unit: String
    init(unit: String) {
        self.unit = unit
    }
    weak var tenant: Person2?
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}
var john2: Person2?
var unit4a2: Apartment2?
john2 = Person2(name: "John Appleseed")
unit4a2 = Apartment2(unit: "4A2")
john2!.apartment = unit4a2
unit4a2!.tenant = john2

print("--- john2 and unit4a2")
john2 = nil
unit4a2 = nil

/// UNOWNED REFERENCES
class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}
print("--- john3")
var john3: Customer?
john3 = Customer(name: "John Appleseed")
john3!.card = CreditCard(number: 1234_5678_9012_3456, customer: john3!)
john3 = nil

/// UNOWNED REFERENCES AND IMPLICITLY UNWRAPPED OPTIONAL PROPERTIES
class Country {
    let name: String
    var capitalCity: City!
    init(name: String, capitalName: String) {
        self.name = name
        self.capitalCity = City(name: capitalName, country: self)
    }
    deinit {
        print("Country \(name) is being deinitialized")
    }
}
class City {
    let name: String
    unowned let country: Country
    init(name: String, country: Country) {
        self.name = name
        self.country = country
    }
    deinit {
        print("City \(name) is being deinitialized")
    }
}
print("--- country")
var country: Country? = Country(name: "Canada", capitalName: "Ottawa")
print("\(country!.name)'s capital city is \(country!.capitalCity.name)")
country = nil

/// STRONG REFERENCE CYCLES FOR CLOSURES
class HTMLElement {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
let heading = HTMLElement(name: "h1")
let defaultText = "some default text"
heading.asHTML = {
    return "<\(heading.name)>\(heading.text ?? defaultText)</\(heading.name)"
}
print(heading.asHTML())

var paragraph: HTMLElement? = HTMLElement(name: "p", text: "hello, world")
print(paragraph!.asHTML())
paragraph = nil

/// RESOLVING STRONG REFERENCE CYCLES FOR CLOSURES
/// DEFINING A CAPTURES LIST
//lazy var someClosure: (Int, String) -> String = {
//    [unowned self, weak self.delegate!] (index: Int, stringToProcess: String) -> String in
//    // closure body goes here
//}

//lazy var someClosure: Void -> String = {
//    [unowned self, weak delagate = self.delegate!] in
//    // closure body goes here
//}

/// WEAK AND UNOWNED REFERENCES
class HTMLElement2 {
    let name: String
    let text: String?
    lazy var asHTML: Void -> String = {
        [unowned self] in
        if let text = self.text {
            return "<\(self.name)>\(text)</\(self.name)>"
        } else {
            return "<\(self.name) />"
        }
    }
    
    init(name: String, text: String? = nil) {
        self.name = name
        self.text = text
    }
    deinit {
        print("\(name) is being deinitialized")
    }
}
var italic: HTMLElement2? = HTMLElement2(name: "italic", text: "Hello world")
print(italic!.asHTML())
italic = nil

