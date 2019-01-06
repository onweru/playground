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
}

let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()
print("Hearts Description is \(heartsDescription)")
