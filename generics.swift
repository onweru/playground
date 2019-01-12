func makeArray<Item>(repeating item: Item, numberOfTimes: Int) -> [Item] {
  var result = [Item]()

  for _ in 0..<numberOfTimes {
    result.append(item)
  }
  return result
}

let knocks = makeArray(repeating: "knock", numberOfTimes: 4)
print(knocks)


// more complex generic example

func anyCommonElements<T: Sequence, U: Sequence>(_ lhs: T, _ rhs: U) -> Bool where T.Element: Equatable, T.Element == U.Element {
  for lhsItem in lhs {
    for rhsItem in rhs {
      if lhsItem == rhsItem {
        return true
      }
    }
  }
  return false
}

let example = anyCommonElements([1, 2, 3], [3])
print(example)

// challenge 
// modify the above function such that it returns an array of the elements present in both sequences


// teamtreehouse challenge generics challenge 1

func duplicate<T>(_ item: T, _ numberOfTimes: Int) -> [T] {
  let tValues = Array(repeating: item, count: numberOfTimes)
  return tValues
}

let ones = duplicate(1, 7)
print(ones)

// teamtreehouse challenge generics challenge 1.2

func map<T, U>(array: [T], transformation: (T) -> U) -> [U] {
 var newArray = [U]()
  for item in array {
    var newItem = transformation(item)
    newArray.append(newItem)
  }
  return newArray
}

func getSquare(number: Int) -> Int {
    return number * number
}

let squareNumbers = map(array: [4, 7, 9], transformation: getSquare )
print(squareNumbers)

// teamtreehouse challenge generics challenge 1.3


func largest<T: Comparable>(in array: [T]) -> T? {
  guard let largestValue = array.max() else {
    return nil
  }
  return largestValue
}