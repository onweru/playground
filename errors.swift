enum PrintError: Error {
  case outOfPaper
  case noToner
  case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String {
 if printerName == "Never Has Toner" {
   throw PrintError.noToner
 } 
 return "Job sent"
}

// simple block 1
do {
  let wrongJob = try send(job: 203, toPrinter: "Never Has Toner")
  print("Wrong Print Job \(wrongJob)")
} catch {
  print(error)
}

// simple block 2

do {
  let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
  print(printerResponse)
} catch {
  print(error)
}


// multiple catch block

do {
  let printerResponse = try send(job: 1440, toPrinter: "Guttenberg")
  print(printerResponse)
} catch PrintError.onFire {
  print("I'll just put this over here, with the rest of the fire.")
} catch let printError as PrintError {
  print("Printer error: \(printError)")
} catch {
  print(error)
}

// use try with optionals

let printerSuccess = try? send(job: 1884, toPrinter: "Mergenthaler")
let printerFailure = try? send(job: 1885, toPrinter: "Never Has Toner")

print("Success \(printerSuccess)")
print("Failed \(printerFailure)")

// defer

var fridgeIsOpen = false
let fridgeContent = ["milk", "eggs", "leftovers"]

func fridgeContains(_ food: String) -> Bool {
  fridgeIsOpen = true
  defer {
    fridgeIsOpen = false
  }

  let result = fridgeContent.contains(food)
  return result
}

let hasBananas = fridgeContains("banana")
print(hasBananas)