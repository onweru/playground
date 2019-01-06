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