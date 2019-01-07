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