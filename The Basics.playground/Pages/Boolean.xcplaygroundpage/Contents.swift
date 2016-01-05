//: Previous [Type Aliases](@previous)
//: # Booleans
//: Swift has a basic _Boolean_ type, called `Bool`. Boolean values a referred to as _logical_, because they can only ever be true or false. Swift provides two Boolean constant values, `true` and `false`:
let orangesAreOrange = true
let turnipsAreDelicious = false

// Type inference helps make Swift code more concise and readable when it initializes constants or variables with other values whose type is already known
if turnipsAreDelicious {
    print("Mmm, tasty turnips!")
} else {
    print("Eww, turnis are horrible!")
}
//: Swift's type safety prevents non-Boolean values from being substitued for `Bool`.
let i = 1
//if i {}
if i == 1 {}
//: Move on to [Tuples](@next)
