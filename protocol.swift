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