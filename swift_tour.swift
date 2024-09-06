// Jordi Becerril Enriquez
// August 25, 2024
// swift book - intro



print("hello world!")



// use let to make constant values, will not change, must assign it a value exactly once.

var myVariable = 42
myVariable  = 50
let myConstant = 42


// swift has types
// providing a value when you create a constant or var lets the complier infer its type.
// you can specify the type by writing it after the variable, seperated by a colon. 

let explicitDouble: Double = 70
let expFloat: Float = 4


// values are never implicilty converted to another type. 
// if you need to convert a value to a different type, explicitly make an instance of the desired
// type.

let label = "The width is "
let width = 94
let widthLabel = label + String(width)

print(widthLabel) 


// simple way to include value in strings: value in parenteses, and write a backslash (\) before 
// the parentheses.

let apples = 3
let oranges = 5
let applesSummary = "I have \(apples) apples."
let fruitSummary = "I have \(apples + oranges) pieces of fruit."

print(fruitSummary)
print()

let quotation = """
    Evan though there's whitespace to the left,
    the actual lines aren't indented.
        Except for this line.
    Duble quotes ("") can appear without being escaped.
    I still have \(apples + oranges) pieces of fruit.
    """
print(quotation) 


// let name = "Jordi"
// let age = 26.0
// let greeting = "My name is \(name) and I'am \(age) years old."
// print(greeting) 
print()


// Create arrays and dictionaries using brackets ([]), and access their elements by
// writing the index or key in brackets.  

var fruits = ["strawberries", "limes", "tangerines"]
print(fruits)
fruits[1] = "grapes"
print(fruits)
print()

var occupations = [
    "Malcom": "Captain",
    "Kaylee": "Mechanic",
]
print(occupations)
occupations["Jayne"] = "Public Relations" 
print(occupations)


// arrays atuomatically gorw as you add elements.
fruits.append("blueberries")
print(fruits)


// also use brackets to write an empty array or dictionary. 
// - for an array: write []
// - for a dictionary: write [:]

fruits = []
occupations = [:]

// if you're assigning an empty array or dictionary to a new variable, or another place 
// where there isn't type info.
// you need to specify the type.

let emptyArray: [String] = []
let emptyDictionary: [String: Float] = [:]


// conditionals: 
// - use if and switch

// loops:
// - use for-in, while, and repeat-while

let individualScored = [75, 43, 103, 87, 12]
var teamScore = 0
for score in individualScored {
    if score > 50 {
        teamScore += 3
    } else {
        teamScore += 1
    }
}
print(teamScore)
print()
// prints "11"



// in swift you can write if or switch after the equal sign(=) of an assignment or after
// return,
// to chose a value based on the condition.

let scoreDecoration = if teamScore > 10 {
    "🎉"
} else {
    ""
}
print("Score:", teamScore, scoreDecoration )
// Prints "Score: 11 🎉"


// you can use if and let together to work with values that might be missing.
// these values are represented as optionals. An optional value either contains a value 
// or contains nil, to indicate that a value is missing.
// write a question mark(?) after the type of a value to mark the value as optinal.

var optinalString: String? = "Hello"
print(optinalString == nil)
// Prints "false"

var optinalName: String? = "John Appleseed"
var greeting = "Hello!"
if let name = optinalName {
    greeting = "Hello, \(name)"
}
print(greeting)
print()


// another way to handle optional values is to provide a default value using the ??
// operator. If the optional value is missing, the default value is used instead.

let nickname: String? = nil
let fullName: String = "John Appleseed"
let informalGreeting = "Hi \(nickname ?? fullName)"

print(informalGreeting)

// shorter spelling to unwrap a value, using the same name for that unwrapped value.

if let nickname {
    print("Hey, \(nickname)")
}
// Doesn't print anything, because nickname is nill




// Switches support any kind of data and a wide variety of comparison operations.

let vegetable = "red pepper"
switch vegetable {
case "celery":
    print("Add some raisins and make ants on a log.")
case "cucumber", "watercress":
    print("That would make a good tea sandwich.")
case let x where x.hasSuffix("pepper"):
    print("Is it a sipcy \(x)?")
default:
    print("Everything tastes good in soup.")
}
print()
// Prints "Is it a spicy red pepper?"



// Use for-in to iterate over items in a dictionary by providing a pair of names to use
// for each key-value pair. Dictionaries are an unordred collection, so their keys and values
// are iterated over in a random order.

let interestingNumbers = [
    "Prime": [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Square": [1, 4, 9, 16, 25],
]
var largest = 0
var typeNum = ""
for (type, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
            typeNum = type
        }
    }
}
print(largest)
print(typeNum)
// prints "25"
print()



// Use while to repeat a block of code until a condition chagnes.

var n = 2
while n < 100 {
    n *= 2
}
print(n)
// Prints "128"


var m = 2
repeat {
    m *= 2
} while m < 100
print(m)
// Prints "128"
print()






// You can keep an index in a loop by using ..< to make a range of indexes.
// - use: ..< to make a range that stops just before the upper value
// - use: ... to make a range that includes both the starting and ending values.

var total = 0
for i in 0..<4 {
    total += i
}
print()
print(total)
print("=================================================")




// - use func to declare a function. Call a function by following its name with a list of arguments
// in parentheses. Use -> to separate the parameters names and types form the function's return type

func greet(person: String, day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greet(person: "Bob", day: "Tuesday"))



// by default, functions use their parameter names as lables for their arguments.
// Write a custom argument label before the parameter name, or write _ to use no argument label.

func greetTwo(_ person: String, on day: String) -> String {
    return "Hello \(person), today is \(day)."
}
print(greetTwo("Bob", on: "Wednesday"))
print()


// - use a tuple to make a compoud value.
// for example, to return multiple values from a function. The elements of a tuple can be reffered
// to either by name or by number.

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min {
            min = score
        }
        sum += score
    }

    return (min, max, sum)
}

let statistics = calculateStatistics(scores: [5, 3, 100, 3, 9])
print(statistics.sum)
// Prints "120"
print(statistics.2)
// Prints "120"




// tuples in swift: 
// https://docs.swift.org/swift-book/documentation/the-swift-programming-language/types

// If the entire body of the function is a single expression, the function implicitly returns that
// expression.
// For example: both functions below have the same behavior

func greetingTwo(for person: String) -> String {
    "Hello, " + person + "!"
}
print(greetingTwo(for: "Dave"))
// Prints "Hello, Dave!"

func anotherGreeting(for person: String) -> String {
    return "Hello, " + person + "!"
}
print(anotherGreeting(for: "Dave"))
// Prints "Hello, Dave!"




// functions can be nested.

func returnFifteen() -> Int {
    var y = 10
    func add() {
        y += 5
    }
    add()
    return y
}
print(returnFifteen())



// functions are a frist-class type. This means that a function can return another function as its
// value

func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print(increment(7))


// a function can take another function as one of its arguments

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item) {
            return true
        }
    }
    return false
}
func lessThanTen(number: Int) -> Bool {
    return number < 10
}
var numbers = [20, 19, 7, 12]
print(hasAnyMatches(list: numbers, condition: lessThanTen))
// clever!



// functions are actually a special case of closures: blocks of code that can be called later.
// you can write a closure without a name by surrounding code with braces {}. Use "in" to 
// separate the arguments and return type from the body.

// numbers.map({ (number: Int) -> Int in
//     let result = 3 * number
//     return result
// })


// concise closure:
let mappedNumbers = numbers.map({ number in 3 * number})
print(mappedNumbers) 
print()

// you can refer to parameter by numbers instead of by name 
// a colsure passes as the last argument to a function can appear immediatly after the parentheses.
// when a closure ("{}") is the only argument to a function, you can omit the parentheses entirely.

let sortedNumbers = numbers.sorted { $0 > $1 }
print(sortedNumbers) 
// Prints "[20, 19, 12, 7]"


// Objects & Classes


// use "class" followed by the class's name to create a class.
class Shape {
    var numberOfSides = 0
    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides." 
    }
}

// create an instance of a class by putting parentheses after the class name.
// use dot syntax to access the properties and methods on the instance.

var shape = Shape()
shape.numberOfSides = 7
var shapeDescription = shape.simpleDescription()
print(shapeDescription) 



// the version above of Shape class is missing something important an initializer to set up the
// class when an instance is created.
// use "init" to create one.

class NamedShape {
    var numberOfSides: Int = 0
    var name: String

    init(name: String) {
        self.name = name
    }

    func simpleDescription() -> String {
        return "A shape with \(numberOfSides) sides."
    }
}

// sub class:
class Square: NamedShape {
    var sideLength: Double

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 4
    }

    func area() -> Double {
        return sideLength * sideLength
    }

    override func simpleDescription() -> String {
        return "A square with sides of length \(sideLength)."
    }
}
let test = Square(sideLength: 5.2, name: "my test square")
print(test.area())
print(test.simpleDescription())




// in addition to simple properties that are stored, properties can have a getter and a setter.

class EquilateralTriangle: NamedShape {
    var sideLength: Double = 0.0

    init(sideLength: Double, name: String) {
        self.sideLength = sideLength
        super.init(name: name)
        numberOfSides = 3
    }

    var perimeter: Double {
        get {
            return 3.0 * sideLength
        }
        set {
            sideLength = newValue / 3.0
        }
    }

    override func simpleDescription() -> String {
        return "An equilateral triangle with sides of length \(sideLength)."
    }
}
var triangle = EquilateralTriangle(sideLength: 3.1, name: "a triangle")
print(triangle.perimeter)
// Prints "9.3"
triangle.perimeter = 9.9
print(triangle.sideLength)
// Prints "3.3000000000000003"
print()


// - set in swift: Assign a value direclty with `=`
// trinalge.perimeter = 9.9

// - get: Access the value by simply referencing the property.
// let currentPerimeter = triangle.perimeter


// willSet: runs before a property's value is changed.
// didSet: runs after a property's value is changed.


class TriangleAndSquare {
    var triangle: EquilateralTriangle {
        willSet {
            square.sideLength = newValue.sideLength
        }
    }
    var square: Square {
        willSet {
            triangle.sideLength = newValue.sideLength
        }
    }
    init(size: Double, name: String) {
        square = Square(sideLength: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}
var triangleAndSquare = TriangleAndSquare(size: 10, name: "another test shape")
print(triangleAndSquare.square.sideLength)
// Prints "10.0"

print(triangleAndSquare.triangle.sideLength)
// Prints "10.0"

triangleAndSquare.square = Square(sideLength: 50, name: "larger square")
print(triangleAndSquare.triangle.sideLength)
// Prints "50.0"
print()


// optionalSquare is an optional: It might contain a Square object, or it might be nil.
// optionalSquare?.sideLength: 
// - if optionalSquare is not nil: swift access sideLength of the Square object.
// - if optionalSquare is nil: swift skips trying to access sideLength and just returns nil.

let optionalSquare: Square? = Square(sideLength: 2.5, name: "optional square")
let sideLength = optionalSquare?.sideLength





// Enumerations and Structures

enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten 
    case jack, queen, king 
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue) 
        }
    }
}
let ace = Rank.ace
let aceRawValue = ace.rawValue
print(ace)
print(aceRawValue)
print()


// experiment: write a function that compares two Rank values by compairng the raw values.

func compareRank(_ rankOne: Rank, _ rankTwo: Rank) -> (rank: Rank, description: String) {
    let largerRank: Rank
    
    if rankOne.rawValue > rankTwo.rawValue {
        largerRank = rankOne
    } else {
        largerRank = rankTwo
    }
    return (largerRank, largerRank.simpleDescription())
}
let two = Rank.two
let result = compareRank(ace,two)
print("Rank: \(result.rank), Description: \(result.description)")


if let convertedRank = Rank(rawValue: 3) {
    print("Rank: \(convertedRank.simpleDescription())")
    let _ = convertedRank.simpleDescription()
} else {
    print("No matching rank for raw value 3.")
}

print()



// enum cases in swift are actual values, and you an use them direclty to define behavior

enum Suit {
    case spades, hearts, diamonds, clubs

    func color() -> String {
        switch self {
        case .spades,.clubs:
            return "black"
        case .hearts,.diamonds:
            return "red"
        }
    }
    
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print(hearts)
print(heartsDescription)
print(hearts.color())

print()





enum ServerResponse {
    case result(String, String)
    case failure(String)
    case salutation(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let salutation = ServerResponse.salutation("Hello! user")

switch salutation {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure... \(message)")
case let .salutation(message):
    print("\(message) and welcome, enjoy your stay.")
}
// Prints "Sunrise ..."
print()




// Use "struct" to create a structure. 
// Structures support many of the same behaviors as classes, including methods and initializers.
// One of the most important differences between strucutres and classes is that structures are 
// always copied when they're passed around in your code, but classes are passed by reference.


struct Card {
    var rank: Rank
    var suit: Suit

    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()
print(threeOfSpadesDescription)
print()

// experiment: write a function that returns an array contaning a full deck of cards, with one card
// of each combination of rank and suit.

func cardDeck() -> [String] {
    var deck: [String] = []
    let suits: [Suit] = [.spades, .clubs, .hearts, .diamonds]
	
    for suit in suits {
        for card in 1...13 {
            if let convertedRank = Rank(rawValue: card) {
				
                let newCard = Card(rank: convertedRank, suit: suit)
                // see how it's made.
                // print(newCard.simpleDescription())
                deck.append(newCard.simpleDescription())
            }
        }
    }

    return deck
}
// print(cardDeck())






// Concurrency

// async: marks the function as asynchronous.
// await: used to call the asynchronous function, indicating that the execution will wait until
// the async function completes.

func fetchUserID(from server: String) async -> Int {
    if server == "primary" {
        return 97
    }
    return 501
}

func fetchUsername(from server: String) async -> String {
    let userID = await fetchUserID(from: server)
    if userID == 501 {
        return "John Appleseed"
    }
    return "Guest"
}
        

// async let: to call an asynchronous function, letting it run in parallel with other 
// asynchronous code. When you use the value it returns, write await.

func connectUser(to server: String) async {
    async let userID = fetchUserID(from: server)
    async let username = fetchUsername(from: server)

    let greeting = await "Hello \(username), user ID \(userID)"
    print(greeting)
}


// Task: used to call asynchronous functions from synchronous code, without waiting for them
// to return.

Task {
    await connectUser(to: "primary")
    print()
}
// Prints "Hello Guest, user ID 97"


// use task groups to strucutre concurrent code. 
// withTaskGroup is built-in function: https://developer.apple.com/documentation/swift/taskgroup

let userIDs = await withTaskGroup(of: Int.self) { group in
    for server in ["primary", "secondary", "development"] {
        group.addTask {
            return await fetchUserID(from: server)
        }
    }

    var results: [Int] = []
    for await result in group {
        results.append(result)
    }
    return results
}
print(userIDs)
print()


// actors are similar to classes, excpet they ensure that different asynchronous functions can
// safely interact with an instance of the same actor at the same time.


actor ServerConnection {
    var server: String = "primary"
    private var activeUsers: [Int] = []

    func connect() async -> Int {
        let userID = await fetchUserID(from: server)
        // ... communicate with server ...
        activeUsers.append(userID)
        return userID
    }
}


// when you call a method on an actor or access one of its properties, you mark that code with:
// await to indicate that it might wait for other code that's already running on the actor to finish

let server = ServerConnection()
let userID = await server.connect()
print(userID) 




// Protocols & Extensions


// use "protocol" to declare a protocol.
// protocol: Define requirements that conforming types must implement.
// classes, enumerations, and structures can all adopt protocols.  


protocol ExampleProtocol {
    var simpleDescription: String { get }
    var simpleNumber: Int { get }
    mutating func adjust()
}


class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var simpleNumber: Int = 001
    var anotherProperty: Int = 69105
    
    func adjust() {
        simpleDescription += " Now 100% adjusted."
    }
}
var a = SimpleClass()
a.adjust()
let aDescription = a.simpleDescription
print(aDescription)

struct SimpleStructure: ExampleProtocol {
    var simpleDescription: String = "A simple structure"
    var simpleNumber: Int = 002

    mutating func adjust() {
        simpleDescription += " (adjusted)"
    }
}
var b = SimpleStructure()
b.adjust()
let bDescription = b.simpleDescription
print(bDescription)





// Extension: used to add functionality to an existing type, such as new methods and computed 
// properties. You can use an extension to add protocol conformance to a type that's declared
// elsewhere, or even to a type that you imported from a library or framework.


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    var simpleNumber: Int {
        return self
    }

    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)
print(7.simpleNumber)
// Prints "The number 7"



// you can use a protocol name just like any other named type - for example, to create a collection
// of objects that have different types but that all conform to a single protocol. When you work 
// with values whose type is a boxed protocol type, methods outside the protocol definition aren't
// available. 


let protocolValue: any ExampleProtocol = a
print(protocolValue.simpleDescription)
// Prints "A very simple class. Now 100% adjusted."






// Error Handling
// you represent errors using any type that adpots the "Error" protocol.


enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}


// use "throw" to throw an error and "throws" to mark a function that can throw an error.
// If you throw an error in a function, the function returns immediately and the code that called
// the function handels the error.

// there are several ways to handle errors. One way is to use "do-catch". Inside the do block, you
// mark code that can throw an error by writing "try" in front of it. Inside the "catch" block,
// the error is automatically given the name "error" unless you give it a different name. 


func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.noToner
    }
    return "Job sent"
}


do {
    let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
    print(printerResponse)
} catch {
    print(error)
}
// Prints "Job sent"



// you can privde multiple catch blocks that handle specific errors. You write a pattern after
// "catch" just as you do after "case" in a switch.

do {
    let printerResponse = try send(job: 1440, toPrinter: "Gutenberg")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}



// another way to handle errors is to use "try?" to convert the result to an optional. If the 
// function throws an error, the specific error is discarded and the result is nil.
// Otherwise, the result is an optional containing the value that the function returned.


let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")


// use "defer" to write a block of code that's executed after all other code in the function, just
// before the function returns. The code is executed regardless of whether the function throws an
// error. You can use "defer" to write setup and cleanup code next to each other, even though they
// need to be executed at different times.  


var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    defer {
        fridgeIsOpen = false
    }

    let result = fridgeContent.contains(food)
    return result
}
if fridgeContains("banana") {
    print("Found a banana")
}
print(fridgeIsOpen)
print()
// Prints "false"







// Generics
// write a name inside angle brackets to make a generic function or type.


func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result: [Item] = []
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
let r = makeArray(repeating: "knock", numberOfTimes: 4)
let nt = makeArray(repeating: 0, numberOfTimes: 4)
print(r)
print(nt)




// you can make generic forms of functions and methods, as well as classes, enumerations, and 
// structures.
// Reimplement the Swift standard library's optional type

enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)




// use "where" right before the body to specify a list of requirements - for example, to require
// the type to implement a protocol, to require two types to be the same, or to require a class 
// to have a particular superclass.


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool 
where T.Element: Equatable, T.Element == U.Element {

    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                return true
            }
        }
    }
    return false
}
print(anyCommonElements([1, 2, 3], [3]))
print()


// experiment: modify the anycommonElements(_:_:) function to make a function that returns an 
// array of the elements that any two sequences have in common.


func anyCommonElementsTwo<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> [T.Element]
where T.Element: Equatable, T.Element == U.Element {
    
    var commonElements: [T.Element] = []

    for lhsItem in lhs {
        for rhsItem in rhs {
            if lhsItem == rhsItem {
                commonElements.append(rhsItem) 
            }
        }
    }
    return commonElements 
}
print(anyCommonElementsTwo([1, 2, 3], [1, 2, 3, 4]))


