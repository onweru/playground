// Array
let shoppingList = ["Grapes", "Dates", "Tomatoes", "French Beans", "Onions"]

for item in shoppingList {
  print(item)
}

// item and index
for (index, item) in shoppingList.enumerated() {
  print("\(index + 1). \(item)")
}