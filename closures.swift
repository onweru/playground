let names = ["Mogg", "Reed", "Kyler", "Greg", "Owen"]

// example 1
func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var  revervedNames = names.sorted(by: backward)

print(revervedNames)

// example 2 ~ (somewhat more concise)

revervedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})

print(revervedNames)

// example 3 ~ (variation of #3)

let locations = ["Nairobi", "Arusha", "Tunis", "Moscow", "Tel Aviv"]
 
var arrangedLocations = locations.sorted(by: {(locale1, locale2) -> Bool in return locale1 < locale2})
print(arrangedLocations)


// example 4 ~ closure with inferred types

var reversedLocations = locations.sorted(by: { locale1, locale2 in return locale1 > locale2 })

print(reversedLocations)

// example 5 ~ closure with an implicit return

reversedLocations = locations.sorted(by: { locale1, locale2 in locale1 > locale2 })

print(reversedLocations)

// example 6 ~ closure using a shorthand

let languages = ["Javascript", "Swift", "Golang", "CSS", "C#"]

var arrangedLanguages = languages.sorted(by: { $0 < $1 })

print(arrangedLanguages)

// example 7 ~ closure using operator

var reversedLanguages = languages.sorted(by: > )
print(reversedLanguages)

// example 8 ~ trailing closure 

let states = ["Montana", "Utah", "Washington", "Texas", "Nevada", "Wyoming"]

var arrangedStates = states.sorted { $0 < $1 }

print(arrangedStates)

// maps

let digitNames = [
  0: "Zero",
  1: "One",
  2: "Two",
  3: "Three",
  4: "Four",
  5: "Five",
  6: "Six",
  7: "Seven",
  8: "Eight",
  9: "Nine",
]

let numbers = [16, 58, 510]

let strings = numbers.map { (number) -> 
  String in 
  var number = number 
  var output = ""
  repeat {
    output = digitNames[number % 10]! + output
    number /= 10
  } while number > 0
  return output
}

print(strings)



// closure that captures values

func makeIncrementer(forIncrement amount: Int) -> () -> Int {
  var runningTotal = 0

  func incrementer() -> Int {
    runningTotal += amount
    return runningTotal
  }

  return incrementer
}

let incrementByTen = makeIncrementer(forIncrement: 10)
let incrementByHundred = makeIncrementer(forIncrement: 100)

let message = "The running total is"

for i in 1...5 {
  print("\(message) \(incrementByTen())")
  print("\(message) \(incrementByHundred())")
}

// auto closures
// auto closure example 1
var customersInLine = ["Natasha", "Rogers", "Klein", "Brenda", "Milfred", "Anna"]

print(customersInLine.count)

let customerProvider = { customersInLine.remove(at: 0) }

print(customersInLine.count)

print("Now serving \(customerProvider())!")

print(customersInLine.count)

// auto closure example 2

func serve(customer customerProvider: () -> String) {
  print("Now Serving \(customerProvider())!")
}

serve(customer: {customersInLine.remove(at: 0)})

print(customersInLine.count)

// auto closure example 3

func serve(customer customerProvider: @autoclosure () -> String) {
  print("Now serving \(customerProvider())!")
}

serve(customer: customersInLine.remove(at: 0))

print(customersInLine.count)


// An escaping autoclosure

var customerProviders: [() -> String] = []

func collectCustomerProviders(_ customerProvider: @autoclosure @escaping () -> String) {
  customerProviders.append(customerProvider)
}

collectCustomerProviders(customersInLine.remove(at: 0))

collectCustomerProviders(customersInLine.remove(at: 0))

print("Collected \(customerProviders.count) closures")

for customerProvider in customerProviders {
  print("Now serving \(customerProvider())!")
}

print(customersInLine.count)