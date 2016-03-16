//: Previous [Subscript Usage](@previous)
//: ## Subscript Options
/*: 
* Subscripts can take any number of input parameters and these input parameters can be of any type. 
* Subscripts can also return any type. 
* Subscripts can use variable parameters and variadic parameters
* Subscripts cannot use in-out parameters or provide default parameter values

A class or structure can provide as many subscript implementations as it needs, and the appropriate subscript to be used will be inferred based on the type of the value or values that are contained within the subscript brackets at the point that subscript is used. This definition of multiple subscripts is known as _subscript overloading_.
While it is most common for subscript to take a single parameter, you can also define a subscript with multiple parameters if it is appropriate for you type.
*/
struct Matrix {
    let rows: Int, columns: Int
    var grid: [Double]
    init(rows: Int, columns: Int) {
        self.rows = rows
        self.columns = columns
        grid = Array(count: rows * columns, repeatedValue: 0.0)
    }
    func indexIsValidForRow(row: Int, column: Int) -> Bool {
        return row >= 0 && row < rows && column >= 0 && column < columns
    }
    subscript(row: Int, column: Int) -> Double {
        get {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            return grid[(row * columns) + column]
        }
        set {
            assert(indexIsValidForRow(row, column: column), "Index out of range")
            grid[(row * columns) + column] = newValue
        }
    }
}
//: You can construct a new `Matrix` instanc by passing an appropriate row and column to its initializer
var matrix = Matrix(rows: 2, columns: 2)
/*: 
The preceding example creates a new `Matrix` instance with two rows and two columns. The `grid` array for this `Matrix` instance is effectively a flattened version of the matrix, as read from top to lef to bottom right
![Subscript Matrix](subscriptMatrix01_2x.png "Subscript Matrix")
Values in the matrix can be set by passing row and column values into the subscript, separated by comma
*/
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
/*: 
These two statements call the subscript's setter to set a value of `1.5` in the top right position of the matrix (where `row` is `0` and `column` is `1`) and `3.2` in the bottome left position (where `row` is `1` and the `column` is `0`)
![Subscript Matrix](subscriptMatrix02_2x.png "Subscript Matrix")
The `Matrix` subscript's getter and setter both contain an assertion to check that the subscript's `row` and `column` values are valid. To assist with this assertions, `Matrix` includes a convenience method call `indexIsValueForRow(_:column:)`, which checks wheter the requested `row` and `column` are inside the bounds of the matrix.
An assertion is triggered if you try to access a subscript that is outside of the matrix bounds
*/
//matrix[2, 2]
