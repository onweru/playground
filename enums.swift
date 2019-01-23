enum Rank: Int {
  case ace = 1
  case one, two, three, four, five
  case king, queen, bishop

  func simpleDescription() -> String {
    switch self {
      case .ace: return "Ace"
      case .king: return "King"
      case .queen: return "Queen"
      case .bishop: return "Bishop"
      default: return String(self.rawValue)
    }
  }
}


let ace = Rank.five
let result = ace.rawValue

print(result)

if let convertedRank = Rank(rawValue: 3) {
  let threeDescription = convertedRank.simpleDescription
}

// SUIT

enum Suit {
  case spades, hearts, diamonds, clubs
  
  func simpleDescription() -> String {
    switch self {
      case .spades: return "spades"
      case .hearts: return "hearts"
      case .diamonds: return "diamonds"
      case .clubs: return "clubs"
    }
  } 

  func color() -> String {
    switch self {
      case .spades, .clubs: return "black"
      case .hearts, .diamonds: return "red"
    }
  }
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
let heartsColor = hearts.color()
print("Hearts Description is \(heartsDescription), and their corresponding color is \(heartsColor)")


// enum modelling a server response

enum ServerResponse {
  case result(String, String)
  case failure(string)
}

let success = ServerResponse.result("6:30 am", "6:30 pm")
let failure = ServerResponse.failure("Out of kebabs")

switch success {
  case let .result(sunrise, sunset): print("sunrise is at \(sunrise) and sunset is at \(sunset).")
  case let .failure(message): print("Failure ... \(message)")
}

// directions

enum CompassPoint {
  case north
  case east
  case south
  case west
}

var directionToHead = CompassPoint.west
print(directionToHead)

switch directionToHead {
  case .north: print("Lots of planets have a north")
  case .east: print("Where the sun rises")
  case .south: print("Watch out for penguins")
  case .west: print("Where the skies are blue")
}

directionToHead = .east

print(directionToHead)

// planets

enum Planet {
  case mercury, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let somePlanet = Planet.earth
switch somePlanet {
  case .earth: print("Home for homo sapiens")
  default: print("Far in the skies")
}

// iterable enum

enum Drink: CaseIterable {
  case coffee, tea, juice, whisky, water, soda
}

let numberOfChoices = Drink.allCases.count

print("\(numberOfChoices) drinks available")

for drink in Drink.allCases {
  print(drink)
}

// enum with associated values

enum BarCode {
  case upc(Int, Int, Int, Int)
  case qrCode(String)
}

var productBarcode = BarCode.upc(8, 85909, 51226, 3)
print(productBarcode)

productBarcode = .qrCode("ABCDEFGXBNSGHETGS")

print(productBarcode)

switch productBarcode {
  case .upc(let numberSystem, let manufacturer, let product, let check): print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
  case .qrCode(let productCode): print("QR code: \(productCode)")
}

productBarcode = BarCode.upc(3, 69304, 71326, 8)

switch productBarcode {
  case let .upc(numberSystem, manufacturer, product, check): print("UPC: \(numberSystem), \(manufacturer), \(product), \(check)")
  case let .qrCode(productCode): print("QR code: \(productCode)")
}

// raw values

enum ASCIIControlCharacter: Character {
  case tab = "\t"
  case lineFeed = "\n"
  case carriageReturn = "\r"
}

// implicit raw values

enum Country: Int {
  case usa = 1, china, germany, britain, india, brazil, russia
}

let europeRebel = Country.britain.rawValue
print(europeRebel)

let poorCountry = 40

if let someCountry = Country(rawValue: poorCountry) {
  switch someCountry {
    case .usa: print("The current super power")
    default: print("Another rich country")
  }
} else {
  print("The country at number \(poorCountry) is not rich")
}

enum ChessPiece: String {
  case king, queen, castle, knight, pon, bishop
}

let headPiece = ChessPiece.king.rawValue
print(headPiece)

// recursive enums

enum ArithmeticExpression {
  case number(Int) 
  indirect case addition(ArithmeticExpression, ArithmeticExpression)
  indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}

// enable indirection in all enums with associated values

indirect enum ArithmeticExpression {
  case number(Int) 
  case addition(ArithmeticExpression, ArithmeticExpression)
  case multiplication(ArithmeticExpression, ArithmeticExpression)
}


let six = ArithmeticExpression.number(6)
let three = ArithmeticExpression.number(3)

let sum = ArithmeticExpression.addition(six, three)

let product = ArithmeticExpression.multiplication(sum, ArithmeticExpression.number(2))

print(sum)
print(product)

func evaluate(_ expression: ArithmeticExpression) -> Int {
  switch expression {
    case let .number(value): return value
    case let .addition(left, right): return evaluate(left) + evaluate(right)
    case let .multiplication(left, right): return evaluate(left) * evaluate(right)
  }
}

print(evaluate(product))