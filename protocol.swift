protocol FullyNamed {
  var fullName: String { get }
}

struct Person: FullyNamed {
  var fullName: String
}

let john = Person(fullName: "John Applessed")

class StarShip: FullyNamed {
  var prefix: String?
  var name: String
  
  init (name: String, prefix: String? = nil) {
    self.name = name
    self.prefix = prefix
  }

  var fullName: String {
    return (prefix != nil ? prefix! + " ": "") + name
  }
}

var ncc1701 = StarShip(name: "Enterprise", prefix: "USS")
print(ncc1701.fullName)

// protocols & methods

protocol RandomNumberGenerator {
  func random() -> Double
}

class LinearCongruentialGenerator: RandomNumberGenerator {
  var lastRandom = 42.0
  let m = 139968.0
  let a = 3877.0
  let c = 39573.0
  func random() -> Double {
    lastRandom = ((lastRandom * a + c).truncatingRemainder(dividingBy: m))
    return lastRandom / m
  }
}

let generator = LinearCongruentialGenerator()
print("Here's a random number: \(generator.random())")
print("And another one: \(generator.random())")

// protocols & mutating instance methods

protocol Togglable {
  mutating func toggle()
}

enum OnOffSwitch: Togglable {
  case off, on
  mutating func toggle() {
    switch self {
      case .off:
        self = .on
      case .on: 
        self = .off
    }
  }
}

var lightSwitch = OnOffSwitch.off
lightSwitch.toggle()

// protocols & initializers

protocol SomeProtocol {
  init(someParameter: Int)
}

class SomeClass: SomeProtocol {
  required init(someParameter: Int) {
    // initiliazer implementation
  }
}

// protocols as types

class Dice {
  let sides: Int
  let generator: RandomNumberGenerator
  
  init(sides: Int, generator: RandomNumberGenerator) {
    self.sides = sides
    self.generator = generator
  }

  func roll() -> Int {
    return Int(generator.random() * Double(sides)) + 1
  }
}

var d6 = Dice(sides: 6), generator: LinearCongruentialGenerator())

for _ in 1...5 {
  print("Random dice rol is \(d6.roll())")
}