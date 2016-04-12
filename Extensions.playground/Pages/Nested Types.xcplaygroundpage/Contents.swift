//: Previous [Subscripts](@previous)
//: Nested Types
//: Extensions can add new nested types to existing classes, structures and enumerations:
extension Int {
    enum Kind {
        case Negative, Zero, Positive
    }
    var kind: Kind {
        switch self {
        case 0:
            return .Zero
        case let x where x > 0:
            return .Positive
        default:
            return .Negative
        }
    }
}
/*:
 This example adds a new nested enumeration to `Int`. This enumeration, called `Kind`, expresses the kind of number that a particular integer represents. Specifically, it expresses whether the number is negative, zero, or positive.
 
 This example also adds a new computed instance property to `Int`, called `kind`, which returns
 */
func printIntegerKinds(numbers: [Int]) {
    for number in numbers {
        switch number.kind {
        case .Negative:
            print("- ")
        case .Zero:
            print("0 ")
        case .Positive:
            print("+ ")
        }
    }
    print("")
}
printIntegerKinds([3, 19, -27, 0, -6, 0, 7])
/*:
 This function, `printIntegerKinds`, takes an input array of `Int` values and iterates over those values in turn. For each integer in the array, the function considers the `kind` computed property for that integer, and prints an appropriate description
 
 NOTE: `number.kind` is already known to be of type `Int.Kind`. Because of that, all of the `Int.Kind` case values can be written in shorthand form inside the `switch` statement, such as `.Negative` rathern than `Int.Kind.Negative`.
 */