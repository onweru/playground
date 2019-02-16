protocol MyProtocol {
  var simpleDescription: String { get }
  mutating func adjust()
}

// apply protocol

class SimpleClass: MyProtocol {
  var simpleDescription: String = "This is a very simple class"
  var numeral: Int = 69105

  func adjust() {
    simpleDescription += " that's now 100% adjusted :)"
    print( simpleDescription)
  }
}

var a = SimpleClass()
let aDescription = a.simpleDescription

print(aDescription)
a.adjust()


struct SimpleStructure: MyProtocol {
  var simpleDescription: String = "This is a very simple structure"

  mutating func adjust() {
    simpleDescription += " that's now adjusted ;)"
    print(simpleDescription)
  }
}

var b = SimpleStructure();
let bDescription = b.simpleDescription

print(bDescription)
b.adjust()

// extensions

extension Int: MyProtocol {
  var simpleDescription: String {
    return "The number \(self)"
  }

  mutating func adjust() {
    self += 42
    print(self)
  }
}

var c = 7
let cDescription = c.simpleDescription

print(cDescription)
c.adjust()