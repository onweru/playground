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

protocol HasArea {
  var area: Double { get }
}

class Circle: HasArea {
  let pi = 3.1415927
  var radius: Double
  var area: Double { return pi * radius * radius }
  
  init(radius: Double ) {
    self.radius = radius
  }
}

class Country: HasArea {
  var area: Double

  init(area: Double) {
    self.area = area
  }
}

class Animal {
  var legs: Int
  
  init(legs: Int) {
    self.legs = legs
  }
}

let objects: [AnyObject] = [
  Circle(radius: 2.0),
  Country(area: 243_610),
  Animal(legs: 4)
]

for object in objects {
  if let objectWithArea = object as? HasArea {
    print("Area is \(objectWithArea.area)")
  } else {
    print("Something that doesn't have an area")
  }
}

// optional protocol requirements

import Foundation

@objc protocol CounterDataSource {
  @objc optional func increment(forCount count: Int) -> Int
  @objc optional var fixedIncrement: Int { get }
}

class Counter {
  var count = 0
  var dataSource: CounterDataSource?

  func increment() {
    if let amount = dataSource?.increment?(forCount: count) {
      count += amount
    } else if let amount = dataSource?.fixedIncrement {
      count += amount
    }
  }
}

class ThreeSource: NSObject, CounterDataSource {
  let fixedIncrement = 3
}

var counter = Counter()
counter.dataSource = ThreeSource()

for _ in 1...4 {
  counter.increment()
  print(counter.count)
}
