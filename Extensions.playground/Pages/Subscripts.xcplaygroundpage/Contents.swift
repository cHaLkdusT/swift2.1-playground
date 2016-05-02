//: Previous [Methods](@previous)
//: ## Subscripts
/*:
 Extensions can add new subscripts to an existing type. This example adds an integer subscript to Swift's built-in `Int` type. This subscript `[n]` returns the deciaml digit `n` places in from the right of the number:
 * `123456789[0]` returns `9`
 * `123456789[1]` returns `8`
 ... and so on:
 */
extension Int {
    subscript(var digitIndex: Int) -> Int {
        var decimalBase = 1
        for _ in 0..<digitIndex {
            decimalBase *= 10
        }
        return (self / decimalBase) % 10
    }
}
746381295[0]
746381295[1]
746381295[2]
746381295[3]
//: If the `Int` value does not have enough digits for the requested, the subscript implmentation returns `0`, as if the number had been padded with zeros to the left:
746381295[9]
0746381295[9]
//: Move on to [Nested Types](@next)
