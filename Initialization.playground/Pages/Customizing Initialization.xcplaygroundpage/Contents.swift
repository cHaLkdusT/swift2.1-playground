//: Previous [Initialization](@previous)
//: ## Customizing Initialization
//: YOu can customize the initialization process with input parameters and optional property types or by assigning constant properties during initialization
//: ### Initialization Parameters
//: You can provide _initialization parameters_ as part of an initializer's definition, to define the types and names of value that customize the initialization process. Initialization parameters have the same capabilities and syntax as function and method parameters.
struct Celsius {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
}
let boilingPointOfWater = Celsius(fromFahrenheit: 212.0)
boilingPointOfWater.temperatureInCelsius
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
freezingPointOfWater.temperatureInCelsius
//: Both initializers convert their single argument into the corresponding Celsius value and store this in a property called `temperatureInCelsius`.
//: ### Local and External Parameter Names
/*:
As with function and method parameters, initialization parameters can have both a local name for use within the initializer's body and an external name for use when calling the initializer.
However, initializers do not have an identifying function name before their parenthesis in the way that funcitons and methods do. Therefore, the names and types of an initializer's parameters play a particularly important role in identifying which initilizer should be called. Because of this, Swift provides and automatic external name for _every_ parameter in an initializer if you don't provide an external name yourself.
`Color` provides an initializer with three appropriately named parameters of the type `Double` for its read, green and blue components. `Color` also provides a second initialzer with a single `white` parameter, which is used to provide the same value for all three color components.
*/
struct Color {
    let red, green, blue: Double
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}
//: Both initilizers can be used to create a new `Color` instance, by providing named value for each initializer parameter
let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)
//: Note that is is not possible to call these initializers without using external parameter names. External name must always be used in an initializer if they are defined, and omitting them is compile-time erro:
//let veryGreen =  Color(0.0,, 1.0, 0.0) // Compile-time error
//: ### Initializer Parameters Without External Names
//: If you do not want to use an external name for an initializer parameter, write an underscore (`_`) instead of an explicit external name for that parameter to override the default behavior
struct Celcius2 {
    var temperatureInCelsius: Double
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    init(_ celcius: Double) {
        temperatureInCelsius = celcius
    }
}
let bodyTemperature = Celcius2(37.0)
//: The initilizer call `Celcius2(37.0)` is clear in its intent without the need for an external parameter anme. It is therefore appropriate to write this initializer as `init(_ celsius: Double)` so that it can be called by providing an unnamed `Double` value.
//: ### Optional Property Types
//: If your custom type has a store property that is logically allowed to have "no value"-perhaps because its value cannot be set during initialization  or because it is allowed to have "no value" at some later point-declare the property name with an _optional_ type. Properties of optional type are automatically initialized with a value of `nil`, indicating that the property is deliberately intended to have "no value yet" during initialization.
class SurveyQuestion {
    var text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let cheeseQuestion = SurveyQuestion(text: "Do you like cheese?")
cheeseQuestion.ask()
cheeseQuestion.response = "Yes, I do like cheese"
//: The response to a survey question cannot be known until it is asked, and so the `response` property is declared with a type of `String?` or "optional `String`". It is automatically assigned a default value of `nil`, meaning "no string yet", when new instance of `SurveyQuestion` is initialized.
//: ### Assigning Constant Properties During Initialization
/*:
You can assign a value to a constant property at any point during initialization, as long as it is set to a definit value by the time initialization finishes. Once a constant property is assigned a value, it can't be further modified.
For class instances, a constant property can be modified during initialization only by the class that introduces it. It cannot be modified by a subclass.
*/
class SurveyQuestion2 {
    let text: String
    var response: String?
    init(text: String) {
        self.text = text
    }
    func ask() {
        print(text)
    }
}
let beetsQuestion = SurveyQuestion2(text: "How about beets?")
beetsQuestion.ask()
beetsQuestion.response = "I also like beets. (But ont with cheese.)"
//: Move on to [Default Initializers](@next)
