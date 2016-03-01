//: Previous [Raw Values](@previous)
//: ## Recursive Enumerations
/*:
Enumerations work well for modeling data when there is a fixed number of possibilities that need to be considered, such as the operations used for doing simple integer arithmetic. These operations let you combined simple arithmetic expression that are made up of integer such as `5` into more complex ones such as `5 + 4`.
One important characteristic of arithmetic expression is that they can be nested. For example, the expression `( 5+ 4 ) * 2` has number on the right side of the multiplication and another expression on the left hand side of the multiplication. Because the data is nested, the enumeration used to store the data also needs to support nesting - this means the enumeration needs to be recursive.
A _recursive enumeration_ is an enumeration that has another instance of the enumeration as the associated value for one or more of the enumeration cases. The compiler has to insert a layer of indirection when it works with recursive enumerations. You indiate that an enumerations case is recursive by writing `indirect` before it`.
*/
enum ArithmeticExpression {
    case Number(Int)
    indirect case Addition(ArithmeticExpression, ArithmeticExpression)
    indirect case Multiplication(ArithmeticExpression, ArithmeticExpression)
}

indirect enum ArithmeticExpression2 {
    case Number(Int)
    case Addition(ArithmeticExpression2, ArithmeticExpression2)
    case Multiplication(ArithmeticExpression2, ArithmeticExpression2)
}

func evaluate(expression: ArithmeticExpression) -> Int {
    switch expression {
    case .Number(let value):
        return value
    case .Addition(let left, let right):
        return evaluate(left) + evaluate(right)
    case .Multiplication(let left, let right):
        return evaluate(left) * evaluate(right)
    }
}
let five = ArithmeticExpression.Number(5)
let four = ArithmeticExpression.Number(4)
let sum = ArithmeticExpression.Addition(five, four)
let product = ArithmeticExpression.Multiplication(sum, ArithmeticExpression.Number(2))
print(evaluate(product))
//: This function evaluates a plain number by simple returning the associated value. It evaluates an addition or multiplication by evaluating the expression on the left hand side, evaluating the expression on the right hand side, and then adding them or multiplying them