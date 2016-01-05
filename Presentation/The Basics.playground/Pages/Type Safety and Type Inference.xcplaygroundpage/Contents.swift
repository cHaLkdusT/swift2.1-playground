//: Previous [Integers and Floating-point numbers](@previous)
//: # Type Safety and Type Infernce
/*: 
Swift is a _type-safe_ language. A type safe language encourages you to be clear about the types of values your code can work with. If part of your code expects a `String`, you can't pass it an `Int` by mistake

Because Swift is type safe, it performs _type checks_ when compiling your code and flags any mismatched types as errors. This enable you to catch and fix errors as early as possible in the development process.

Type-checking helps you avoid errors when you're working with different types of values. However, this doesn't mean that you have to specify the type of every constant and variable that you declare. If you don't specify the type of value you need, Swift uses _type inference_ to work out the appropriate type.

Because of type inference, Swift requires far fewer type declarations than languages such as C or Objective-C.

Type inference is particulary useful when you declare a constant or variable with an initial value. This is often done by assigning a _literal value_ (or _literal_) to the constant or variable at the point that you declare it.
*/

//: Swift always chooses `Double` (rather than `Float`) when inferring the type of floating-point literals in an expression

//: Move on to [Numberic Literals](@next)
