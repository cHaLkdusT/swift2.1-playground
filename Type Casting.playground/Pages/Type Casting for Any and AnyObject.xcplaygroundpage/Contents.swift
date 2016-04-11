//: Previous [Type Casting](@previous)
///
class MediaItem {
    var name: String
    init(name: String) {
        self.name = name
    }
}
class Movie: MediaItem {
    var director: String
    init(name: String, director: String) {
        self.director = director
        super.init(name: name)
    }
}
class Song: MediaItem {
    var artist: String
    init(name: String, artist: String) {
        self.artist = artist
        super.init(name: name)
    }
}
// ## Type Casting for Any and AnyObject
/*:
 Swift provides two special type aliases for working with non-specify types:
 * `AnyObject` can represent an instance of any class type.
 * `Any` can represent an instance of any type at all, including function types.
 
 NOTE: Use `Any` and `AnyObject` only when you explicitly need the behavior and capabilities they provide. It is always better to be specific about the types you expect to work with in your code.
### AnyObject
 When working with Cocoa APIs, sometimes you receive an array of a type `[AnyObject]`, or "an array of values of any object type". Objective-C currently supports explicitly type arrays, but older versions of the language did not have this feature. However, you can often be confident about the type of objects contained in such an array just from the information you know about the API that provided the array.
 
 In these situations, you can use the forced version of the type cast operator (`as!`) to downcast each item in the array to a more specific class type than `AnyObject`, without the need for optional unwrapping.
 
 The example below defines an array of type `[AnyObject]` and populates this array with three instance of `Movie` class:
 */
let someObjects: [AnyObject] = [
    Movie(name: "2001: A Space Odyssey", director: "Stanley Kubrick"),
    Movie(name: "Moon", director: "Duncan Jones"),
    Movie(name: "Alien", director: "Ridley Scott")
]
//: Because this array is known to contain only `Movie` instances, you can downcast and unwrap directly to a nonoptional `Movie` with the forced version of the type cast operator (`as!`):
for object in someObjects {
    let movie = object as! Movie
    print("Movie: \'\(movie.name)\', dir. \(movie.director)")
}
//: For an even shorter form of this loop, downcast the `someObjects` array to a type of `[Movie]' instead of downcasting each item
for movie in someObjects as! [Movie] {
    print("Movie: \'\(movie.name)\', dir. \(movie.director)")
}
//: ### Any
//: Here's an example of using `Any` to work with a mix of different types, including function types and non-class types. The example creates an array called `things`, which can store of type `Any`:
var things = [Any]()

things.append(0)
things.append(0.0)
things.append(42)
things.append(3.14159)
things.append("hello")
things.append((3.0, 5.0))
things.append(Movie(name: "Ghostbusters", director: "Ivan Reitman"))
things.append({ (name: String) -> String in "Hello, \(name)"})
things.append(Song(name: "Test", artist: "Test"))
/*:
 The `things` array contains two `Int` values, two `Double` values, a `String` value, a tuple of type `(Double, Double)`, the movie "Ghostbusters", and a closure expression that takes a `String` value and returns another `String` value.
 
 You can use the `is` and `as` operators in a `switch` statement's cases to discover the specific type of a constant or variable that is known only to be of type `Any` or `AnyObject`. This example below iterates over the items in the `things` array and queries the type of each item with a `switch` statement. Several of the `switch` statement's cases bind their matched value to a constant of the specified type to enable its value to be printed.
 */
for thing in things {
    switch thing {
    case 0 as Int:
        print("zero as an Int")
    case 0 as Double:
        print("zero as a Double")
    case let someInt as Int:
        print("an integer value of \(someInt)")
    case let someDouble as Double where someDouble > 0:
        print("a positive double value of \(someDouble)")
    case is Double:
        print("some other double value that I don't want to print")
    case let someString as String:
        print("a string value of \"\(someString)\"")
    case let (x, y) as (Double, Double):
        print("an (x, y) point at \(x), \(y)")
    case let movie as Movie:
        print("a movie called '\(movie.name)', dir. \(movie.director)")
    case let stringConverter as String -> String:
        print(stringConverter("Michael"))
    default:
        print("something else")
    }
}