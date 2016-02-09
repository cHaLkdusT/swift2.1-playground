//: Previous [Nil Coalesing Operator](@previous)
//: ## Range Operators
//: Swift includes two _range operators_, which are shortcuts for expressing a range of values.
//: ### Close Range Operator
//: (`a...b`) Defines a range that runs from `a` to `b` and includes the values `a` and `b`. The value of `a` must not be greater than `b`.
for index in 1...5 {
    print("\(index) times 5 i s \(index * 5)")
}
//: ### Half-open Range Operator
//: (`a..<b`) defines a range that runs from `a` to `b`, but does not include `b`.
let names = ["Anna", "Alex", "Brian", "Jack",]
let count = names.count
for i in 0..<count {
    print("Person \(i + 1) is called \(names[i]).")
}
//: Move on to [Logical Operators](@next)
