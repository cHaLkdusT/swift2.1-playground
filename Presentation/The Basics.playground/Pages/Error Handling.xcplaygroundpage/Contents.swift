//: Previous [Optionals](@previous)
//: # Error Handling
//: You use _error handling_ to respond to error conditions your program may encounter during execution
import Foundation
func canThrowAnError() throws {
    
}

do {
    try canThrowAnError()
} catch let error as NSError {
    
}
catch {
    
}

func makeASandwich() throws {
    // ...
}
func eatASandwich() { }
func washDishes() { }
func buyGrocecires(ingredients: [AnyObject]) { }
enum TutorialError: ErrorType {
    case OutOfCleanDishes
    case MissingIngredients(ingredients: [AnyObject])
}
do {
    try makeASandwich()
    eatASandwich()
} catch TutorialError.OutOfCleanDishes {
    washDishes()
} catch TutorialError.MissingIngredients(let ingredients) {
    buyGrocecires(ingredients)
}
//: Move on to [Assertions](@next)
