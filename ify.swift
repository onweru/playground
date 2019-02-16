var optionalString: String? = "Bonjour"

var optionalName: String? = "Weru"

var greeting = "Hola"

if let name = optionalName {
  greeting = "Hello, \(name)"
}

let nickName: String? = nil
let alternativeGreeting = "Bonjour \(nickName ?? optionalName)"

print("G\n \(greeting)")

print("GA\n \(alternativeGreeting)")

// optional binding
let possibleNumber = "3"

if let actualNumber = Int(possibleNumber) {
  print("The string \"\(possibleNumber)\" has an integer value of \(actualNumber)")
} else {
  print("The string \"\(possibleNumber)\" could not be converted to an integer")
}