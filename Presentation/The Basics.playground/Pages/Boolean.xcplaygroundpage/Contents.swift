//: Previous [Type Aliases](@previous)
//: # Booleans
//: Swift has a basic _Boolean_ type, called `Bool`. Boolean values a referred to as _logical_, because they can only ever be true or false. Swift provides two Boolean constant values, `true` and `false`:
let oragnesAreOrange = true
let turnisAreDelicious = false
//: Swift's type safety prevents non-Boolean values from being substitued for `Bool`.
if turnisAreDelicious {
    print("YummY")
} else {
    print("ew")
}
//: Swift's type safety prevents non-Boolean values from being substituted for `Bool`. The following example reports a compile-time error:
let i = 1
//if i {
    // this example will not compile and will report an error
//}
//: However, the alternative example below is valid
if i == 1 {
    // this example will compile successfully
}
//: Move on to [Tuples](@next)
