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

// block 1
do {
  let wrongJob = try send(job: 203, toPrinter: "Never Has Toner")
  print("Wrong Print Job \(wrongJob)")
} catch {
  print(error)
}

// block 2

do {
  let printerResponse = try send(job: 1040, toPrinter: "Bi Sheng")
  print(printerResponse)
} catch {
  print(error)
}