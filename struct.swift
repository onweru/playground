// dependencies of our structure

enum Rank: Int {
  case ace = 1
  case two, three, four, five, six, seven, eight, nine, ten
  case jack, queen, king

  func simpleDescription() -> String {
    switch self {
      case .ace: return "Ace"
      case .jack: return "Jack"
      case .queen: return "Queen"
      case .king: return "King"
      default: return String(self.rawValue)
    }
  }
}

enum Suit: Int {
  case spades = 1
  case hearts, diamonds, clubs
  
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


//  define struct

struct Card {
  var rank: Rank
  var suit: Suit
  func simpleDescription() -> String {
    return "The \(rank.simpleDescription()) of \(suit.simpleDescription())"
  }
}


let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription();

print(threeOfSpadesDescription)


func deckOfCards() {
  var deck = [String]()
  var n = 1

  while let rank = Rank(rawValue: n) {
    var m = 1 
    while let suit = Suit(rawValue: m) {
      let newCard = Card(rank: rank, suit: suit)
      let newCardName = newCard.simpleDescription()
      deck.append(newCardName)
      m += 1
    }
    n += 1
  }
  print(deck)
}

deckOfCards()

struct Queue<Element> {
  var array: [Element] = []

  var isEmpty: Bool {
    return array.isEmpty
  }

  var count: Int {
    return array.count
  }

  mutating func enqueue(_ element: Element) {
    array.append(element)
  }

  mutating func dequeue() -> Element? {
    if array.isEmpty == true {
      return nil
    }
    return array.remove(at: 0)
  }
}

