//: Playground - noun: a place where people can play


//: example
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

let ace = Rank.queen
let aceRawValue = ace.rawValue
print(Rank.jack)



//: experiment, change raw value.


//: example experiment add color() and add red to spades and clubs and black for hearts and diamonda, (see above)





//: example to see how the case of requesting the sunrise and sunset from a server.

enum ServerResponse {
    case result(String, String)
    case failure(String)
    case timeChange(String)
}

let success = ServerResponse.result("6:00 am", "8:09 pm")
let failure = ServerResponse.failure("Out of cheese.")
let timeChange = ServerResponse.timeChange("I'm a sleep")

switch timeChange {
case let .result(sunrise, sunset):
    print("Sunrise is at \(sunrise) and sunset is at \(sunset).")
case let .failure(message):
    print("Failure...  \(message)")
case let .timeChange(sleep):
    print("... \(sleep)")
}

//: experiment, add a third.

enum Suit: Int {
    case spades = 1
    case hearts, diamonds, clubs
    
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
    
    func color() -> String {
        switch self {
        case .spades, .clubs:
            return "black"
        case .hearts, .diamonds:
            return "red"
        }
    }
}

let heartsDescription = Suit.hearts.simpleDescription()
let heartsColor = Suit.hearts.color()
//: example
struct Card {
    var rank: Rank
    var suit: Suit
    func simpleDescription() -> String {
        return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
    }
}
let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()


//: experiment, add a method for card. Didn't really get this part of method, classes etc.



//: example  PROTOCOLS AND EXTENTIONS experiment write an enumeration


protocol ExampleProtocol {
    var simpleDescription: String { get }
    mutating func adjust()
}



class SimpleClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var anotherProperty: Int = 69105
    func adjust() {
        simpleDescription += "  Now 100% adjusted."
    }
}

class CangeingClass: ExampleProtocol {
    var simpleDescription: String = "A very simple class."
    var favoDrink: String  = "Milk is my number one"
    
    func adjust() {
        favoDrink += " favorite drink ever."
    }
}

let cangeingClass = CangeingClass()
cangeingClass.adjust()

let myFavoriteDrink = cangeingClass.favoDrink
print(myFavoriteDrink)



//: example, experiment write a double


extension Int: ExampleProtocol {
    var simpleDescription: String {
        return "The number \(self)"
    }
    mutating func adjust() {
        self += 42
    }
}
print(7.simpleDescription)

//: experiment write a double


extension Double {
    var absoluteValue: Double {
        return abs(self)
    }
}

let exampleDouble: Double = -99.0
let exampleAbsoluteValue = exampleDouble.absoluteValue



//: example experiment change name: change the throw property?


enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
    if printerName == "Never Has Toner" {
        throw PrinterError.onFire
    }
    return "Job sent"
}


do {
    let printerResponse = try send(job: 1440, toPrinter: "Never Has Toner")
    print(printerResponse)
} catch PrinterError.onFire {
    print("I'll just put this over here, with the rest of the fire.")
} catch let printerError as PrinterError {
    print("Printer error: \(printerError).")
} catch {
    print(error)
}


//: example testing if the function can differ names.

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
fridgeContains("milk")
print(fridgeIsOpen)

//: example



func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
    var result = [Item]()
    for _ in 0..<numberOfTimes {
        result.append(item)
    }
    return result
}
makeArray(repeating: "knock", numberOfTimes: 4)

// Reimplement the Swift standard library's optional type
enum OptionalValue<Wrapped> {
    case none
    case some(Wrapped)
}
var possibleInteger: OptionalValue<Int> = .none
possibleInteger = .some(100)


func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool
    where T.Iterator.Element: Equatable, T.Iterator.Element == U.Iterator.Element {
        for lhsItem in lhs {
            for rhsItem in rhs {
                if lhsItem == rhsItem {
                    return true
                }
            }
        }
        return false
}
anyCommonElements([1, 2, 3], [3])


//: comment: The last func, is hard.


//: Swift exercises Assignment 02


func isEven(num: Int) -> Bool {
    if num == 10 {
        return true
    } else {
        return false
    }
}


print(isEven(num: 10))








class myPlanets{
    enum Planet: Int {
        case mercury = 1, venus, earth, mars, jupiter, saturn, uranus, naptune
        func simpleDescription() -> String {
            switch self {
            case .mercury:
                return "mercury"
            case .venus:
                return "venus"
            case .earth:
                return "Earth is the planet I live on"
            case .mars:
                return "mars"
            case .jupiter:
                return "jupiter"
            case .saturn:
                return "saturn"
            case .uranus:
                return "uranus"
            case .naptune:
                return "naptune"
            }
        }
        func distance() -> String {
            switch self {
            case .mercury:
                return "1st planet"
            case .venus:
                return "2nd planet"
            case .earth:
                return "Our planet"
            case .mars:
                return "Middle planet"
            case .jupiter:
                return "5th planet"
            case .saturn:
                return "6th planet"
            case .uranus:
                return "7th planet"
            case .naptune:
                return "8th planet"
            }
        }
    }
}

let earth = myPlanets.Planet.earth.simpleDescription()
print(earth)




