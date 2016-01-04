/// SUBSCRIPTS
/// SUBCRIPT SYNTAX
// get set
//subscript(index: Int) -> Int {
//    get {
//        // return an appropriate subscript value here
//        return 1
//    }
//    set {
//        // perform a suitable setting action here
//    }
//}

// get
//subscript(index: Int) -> Int{
//    // return an appropriate subscript value here
//}

struct TimesTable {
    let multiplier: Int
    subscript(index: Int) -> Int {
        return multiplier * index
    }
}
let threeTimesTable = TimesTable(multiplier: 3)
print("six times three is \(threeTimesTable[6])")

/// SUBSCRIPT USAGE
var numberOfLegs = ["Spider": 8, "Ant": 6, "Cat": 4]
numberOfLegs["Bird"] =  2

/// SUBSCRIPT OPTIONS
// Can take nay number of input parameters, and these input parameters can be of any type
// Can also retun any type
// Can use variable parameter and variadic parameters
// BUT cannot use in-out or provide default parameter values

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
var matrix = Matrix(rows: 2, columns: 2)
matrix[0, 1] = 1.5
matrix[1, 0] = 3.2
//matrix[2, 2]