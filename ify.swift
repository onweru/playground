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