//: Previous [While Loops](@previous)
//: ## Conditional Statements
/*:
 It is often useful to execute different pieces of code based on certain conditions. You might want to run an extra piece of code when an error ocures, or to display a message when a value becomes too high or too low.

 Swift provides two ways to add conditional branches to your code, knonw as the `if` and the `switch` statement. Typically, you use the `if` statement to evaluate simple conditions with only a few possible outcomes. The `switch` statement is better suited to more complex condition with multiple possible permutations, and is useful in situations where pattern-matching can help select an appropriate code branch to execute
*/

//: ### If
//: In its simplest form, the `if` statement has a single `if` condition. It executes a set of statements only if that condition is `true`
var temperatureInFahrenheit = 30
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
}

//: The `if` statement can provide an alternative set of statements, knonw as an _else clause_, for when the `if` condition is `false`.
temperatureInFahrenheit = 40
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else {
    print("It's not that cold. Wear a t-shirt")
}

//: You can chain multiple `if` statements together, to consider additional clauses
temperatureInFahrenheit = 90
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
} else {
    print("It's not that cold. Wear a t-shirt")
}

//: The final `else` clause is optinoal, however, and can be excluded if the set of conditions does not need to be complete
temperatureInFahrenheit = 72
if temperatureInFahrenheit <= 32 {
    print("It's very cold. Consider wearing a scarf.")
} else if temperatureInFahrenheit >= 86 {
    print("It's really warm. Don't forget to wear sunscreen")
}

//: Switch
/*: 
 A `switch` statement considers a value and compares it againts several possible matching patterns. It then executes an appropriate block of code, based on the first pattern that matches successfully. A `switch` statement provides an alternative to the `if` statement for responding to multiple potential states

 The `switch` statement determines which branch should be selected. This is known as _switching_ on the value that is being considered.

 Every `switch` statement must be _exhaustive_. That is, every possible value of the type being considered must be matched by one of the `switch` cases.  If it is not appropriate to provide a `switch` case for every possible value, you can define catch-all case to cover any values that are not addressed explicitly. This catch-all case is indicated by the `default` keyword, and must always appear last
*/
let someCharacter: Character = "z"
switch someCharacter {
case "a":
    print("The first letter of the alphabet")
case "z":
    print("The last letter of the alphabet")
default:
    print("Some other character")
}

//: ### No Implicit Fallthrough
/*: 
 In contrast with `switch` statements in C and Objective-C, `switch` statements in Swift do not fall through the bottom of each case and into the next one by default. Instead, the entire `switch` statement finishes its execution as soon as the first matching `switch` case is completed, without requiring an explicit `break` statement. This makes the `switch` statement safer and easier to use than in C, and avoids executing more than one `switch` case by mistake

 > Although `break` is not required in Swift, you can still use a `break` statement to match and ignore a particular case, or to break out of a matched case before that case has completed its execution

 The body of each case _must_ contain at least one executable statement. It is not valid to write following code, because the first case is empty:
*/
//let anotherCharacter: Character = "a"
//switch anotherCharacter {
//    case "a":
//    case "A":
//    print("The letter A")
//default:
//    print("Not the letter A")
//}
/*: 
 Unlike a `switch` statement in C, this `switch` statement does not both `"a"` and `"A"`. Rather, it reports a compile-time error that `case "a":` does not contain any executable statements. This approach avoid accidental fallthrough from one case to another, and makes for safer code that is clearer in its intent.

 Multiple matches for a single `switch` case can be separated by commas, and can be written over multiple lines if the list is long:
*/
let anotherCharacter: Character = "a"
switch anotherCharacter {
case "a", "A":
      print("The letter A")
default:
    print("Not the letter A")
}

//: > To opt in to fallthrough behaviour for a particluar `switch` case, use the `fallthrough` keyword.

//: ### Interval Matchings
//: Values in `switch` case can be checked for their inclusion in an interval. This example uses number intervals to provide a natural-language count for numbers of any size:
let approximateCount = 62
let countedThings = "moons orbiting Saturn"
var naturalCount: String
switch approximateCount {
case 0:
    naturalCount = "no"
case 1..<5:
    naturalCount = "a few"
case 5..<12:
    naturalCount = "several"
case 12..<100:
    naturalCount = "dozens of"
case 100..<1000:
    naturalCount = "hundreds of"
default:
    naturalCount = "many"
}
print("There are \(naturalCount) \(countedThings)")

//: ### Tuples
/*:
You can use tuples to test multiple values in the same `switch` statemetn. Each elemnt of the tuple can be tested against a different value or interval of values. Alternatively, you use the underscore character (`_`), also known as the wildcard patter, to match any possible value

The example below takes an (x, y) point, expressed as a simple tuple of type (`Int`, `Int`) and categorizes it on the graph that follows the example:
*/
let somePoint = (1, 1)
switch somePoint {
case (0, 0):
    print("(0, 0) is at the origin")
case (_, 0):
    print("(\(somePoint.0), 0) is on the x-axis")
case (0, _):
    print("(0, \(somePoint.1) is on the y-axis)")
case (-2...2, -2...2):
    print("(\(somePoint.0), \(somePoint.1) is inside the box)")
default:
    print("(\(somePoint.0), \(somePoint.1) is outside the box)")
}
//: ![Coordinate Graph Simple](coordinateGraphSimple_2x.png "Coordinate Graph Simple")
//: The `switch` statement determines if the point is at the origin (0, 0); on the red x-axis; on the orange y-axis; inside the blue 4-by-4 box centered on the origin; or outside of the box

//: ### Value Bindings
//: A `switch` case can bind the value or values it matches to temporary constants, for use in the body of the case. This is known as _value binding_, because the values are "bound" to temporary constants within the case's body.
let anotherPoint = (2, 0)
switch anotherPoint {
case (let x, 0):
    print("on the x-axis with an x value of \(x)")
case (0, let y):
    print("on the y-axis with a y value of \(y)")
case let (x, y):
    print("somewhere else at (\(x), \(y))")
}
//: ![Coordinate Graph Medium](coordinateGraphMedium_2x.png "Coordinate Graph Medium")

//: ### Where
//: A `switch` case can use a `where` clause to check for additional conditions.
let yetAnotherPoint = (1, -1)
switch yetAnotherPoint {
case let (x, y) where x == y:
    print("(\(x), \(y)) is on the line x == y")
case let (x, y) where x == -y:
    print("(\(x), \(y)) is on the line x == -y")
case let (x, y):
    print("(\(x), \(y)) is just some artibitrary point")
}
//: ![Coordinate Graph Complex](coordinateGraphComplex_2x.png "Coordinate Graph Complex")

//: ### Compound Cases
//: Multiple switch cses that share the same body can be combined by writing severl patterns after `case`, with a comma between each of the patters. If any of the pattern match, then the case is considered to match. The patterns can be writtent over multiple lines if the list is long.
switch  someCharacter {
case "a", "e", "i", "o", "u":
    print("\(someCharacter) is a vowel")
    case "b", "c", "d", "f", "g", "h", "j", "k", "l", "m", "n", "p", "q", "r", "s", "t", "v", "w", "x", "y", "z":
    print("\(someCharacter) is a consonant")
default:
    print("\(someCharacter) is not a vowel or a consonant")
}

//: Compound cases can also include value bindings. All of the patterns of a compound case have to include the same set of value bindings, and each binding has to get a value of the same type from all of the patterns in the compound case. This ensures that, no matter which part of the compound case matched, the code in the body of the case can always access a value for the binding and that the value always has the same type.
let stillAnotherPoint = (9, 0)
switch stillAnotherPoint {
case (let distance, 0), (0, let distance):
    print("On an axis, \(distance) from the origin")
default:
    print("Not on an axis")
}
//: The `case` above has two patterns: `(let distance, 0)` matches points on the x-axis and `(0, let distance)` matches points on the y-axis. Both patterns include a binding for `distance` and `distance is an integer in both patterns - which means that the code in the body of the `case` can always access a value for `distance`.
//: Move on to [Control Transfer Statements](@next)
