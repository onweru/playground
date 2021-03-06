func swapTwoInts(_ a: inout Int, _ b: inout Int) {
  let temporaryA = a;
  a = b
  b = temporaryA
}

var someInt = 3
var anotherInt = 107

swapTwoInts(&someInt, &anotherInt)
print("SomeInt is now \(someInt), and anotherInt is now \(anotherInt)")

func swapTwoStrings(_ a: inout String, _ b: inout String) {
  let temporaryA = a
  a = b
  b = temporaryA
}

func swapTwoDoubles(_ a: inout Double, _ b: inout Double) {
  let temporaryA = a
  a = b
  b = temporaryA
}

func swapTwoValues<T>(_ a: inout T, _ b: inout T) {
  let temporaryA = a
  a = b
  b = temporaryA
}

var someString = "Hola"
var anotherString = "Amigo"
swapTwoValues(&someString, &anotherString)
print("SomeString is now \(someString), and anotherString is now \(anotherString)")

struct Stack<Element> {
  var items = [Element]()
  
  mutating func push(_ item: Element) {
    items.append(item)
  }
  
  mutating func pop() -> Element {
    return items.removeLast()
  }
  
  // conformance to the Container protocol
  
  mutating func append(_ item: Element) {
    self.push(item)
  }
  
  var count: Int {
    return items.count
  }
  
  subscript(i: Int) -> Element {
    return items[i]
  }
}

var stackOfStrings = Stack<String>()
stackOfStrings.push("Uno")
stackOfStrings.push("Dos")
stackOfStrings.push("Tres")
stackOfStrings.push("Cuatro")
stackOfStrings.push("Nuevo")
print(stackOfStrings)
let fromTheTop = stackOfStrings.pop()
print(fromTheTop)
print(stackOfStrings)

// extend generic type

extension Stack {
  var topItem: Element? {
    return items.isEmpty ? nil : items[items.count - 1]
  }
}

if let topItem = stackOfStrings.topItem {
  print("The top item on the stack is \(topItem).")
}

// generic type constraints

func findIndex<T: Equatable>(of valueToFind: T, in array:[T]) -> Int? {
  for (index, value) in array.enumerated() {
    if value == valueToFind {
      return index
    }
  }
  return nil
}

let doubleIndex = findIndex(of: 9.3, in: [3.14159, 0.1, 0.25])
// print(doubleIndex)

let stringIndex = findIndex(of: "Andrea", in: ["Mike", "Malcolm", "Andrea"])
// print(stringIndex)

// associated types

protocol Container {
  associatedtype Item
  mutating func append(_ item: Item)
  var count: Int { get }
  subscript(i: Int) -> Item { get }
}

struct InStack: Container {
  var items = [Int]()
  
  mutating func push(_ item: Int) {
    items.append(item)
  }
  
  mutating func pop() -> Int {
    return items.removeLast()
  }
  
  typealias Item = Int
  
  mutating func append(_ item: Int) {
    self.push(item)
  }
  
  var count: Int {
    return items.count
  }
  
  subscript(i: Int) -> Int {
    return items[i]
  }
}

protocol SuffixableContainer: Container {
  associatedtype Suffix: SuffixableContainer where Suffix.Item == Item
  func suffix(_ size: Int) -> Suffix
}

extension Stack: SuffixableContainer {
  func suffix(_ size: Int) -> Stack {
    var result = Stack()
    for index in (count-size)..<count{
      result.append(self[index])
    }
    return result
  }
}

var stackOfInts = Stack<Int>()
stackOfInts.append(10)
stackOfInts.append(20)
stackOfInts.append(30)
let suffix = stackOfInts.suffix(2)

extension InStack: SuffixableContainer {
  func suffix(_ size: Int) -> Stack<Int> {
    var result = Stack<Int>()
    for index in (count-size)..<count {
      result.append(self[index])
    }
    return result
  }
}

// generic where clauses

func allItemsMatch<C1: Container, C2: Container>(_ someContainer: C1, _ anotherContainer: C2) -> Bool where C1.Item == C2.Item, C1.Item: Equatable {
  if someContainer.count != anotherContainer.count {
    return false
  }
  
  for i in 0..<someContainer.count {
    if someContainer[i] != anotherContainer[i] {
      return false
    }
  }
  return true
}

//var arrayOfStrings = ["Uno", "Dos", "Tres"]
//
//if allItemsMatch(stackOfStrings, arrayOfStrings) {
//  print("All items match.")
//} else {
//  print("Nor all items match.")
//}


extension Stack where Element: Equatable {
  func isTop(_ item: Element) -> Bool {
    guard let topItem = items.last else {
      return false
    }
    return topItem == item
  }
}


if stackOfStrings.isTop("tres") {
  print("Top element is tres")
} else {
  print("Top element is something else")
}

//struct NotEquatable { }
//var notEquatableStack = Stack<NotEquatable>()
//let notEquatableValue = NotEquatable()
//notEquatableStack.push(notEquatableValue)
//notEquatableStack.isTop(notEquatableValue)

extension Container where Item: Equatable {
  func startsWith(_ item: Item) -> Bool {
    return count >= 1 && self[0] == item
  }
}


//if [9, 9, 9].startsWith(42) {
//  print("Starts with 42.")
//} else {
//  print("Starts with something else")
//}

extension Container where Item == Double {
  func average() -> Double {
    var sum = 0.0
    
    for index in 0..<count {
      sum += self[index]
    }
    return sum / Double(count)
  }
}

//print([1260.0, 1200.0, 98.6, 37.0].average())
