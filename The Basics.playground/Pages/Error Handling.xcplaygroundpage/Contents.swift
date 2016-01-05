//: Previous [Optionals](@previous)
//: # Error Handling
//: You use _error handling_ to respond to error conditions your program may encounter during execution
func canThrowAnError() throws {
    // this function may or may not throw an error
}
do {
    try canThrowAnError()
    // no error was thrown
} catch {
    // an error was thrown
}

//func makeASandwich() throws {
//    // ...
//}
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch Error.OutOfCleanDishes {
//    washDishes()
//} cathc Error.MissingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}
//: Move on to [Assertions](@next)
