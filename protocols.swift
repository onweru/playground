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

