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