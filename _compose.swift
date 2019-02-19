// protocol inheritance

protocol Named {
  var name: String { get }
}

protocol Aged {
  var age: Int { get }
}

struct Person: Named, Aged {
  var name: String
  var age: Int
}

func wishHappyBirthday(to celebrator: Named & Aged) {
  print("Happy birthday, \(celebrator.name), you're \(celebrator.age)!")
}

let birthdayPerson = Person(name: "Miles", age: 21)
wishHappyBirthday(to: birthdayPerson)

class Location {
  var latitude: Double 
  var longitude: Double

  init(latitude: Double, longitude: Double) {
    self.latitude = latitude
    self.longitude = longitude
  }
}

class City: Location, Named {
  var name: String
  
  init(name: String, latitude: Double, longitude: Double) {
    self.name = name
    super.init(latitude: latitude, longitude: longitude)
  }
}

func beginConcert(in location: Location & Named) {
  print("Hello, \(location.name)")
}

let seattle = City(name: "Seattle", latitude: 47.6, longitude: -122.3)
beginConcert(in: seattle)

// check for protocol conformance