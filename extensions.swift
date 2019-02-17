extension Double {
  var km: Double {
    return self * 1_000.0
  }
  var m: Double { 
    return self 
  }
  var cm: Double {
    return self / 100.0
  }
  var mm: Double {
    return self / 1_000.0
  }
  var ft: Double {
    return self / 3.28084
  }
}

let oneInch = 25.4.mm

print("One inch us \(oneInch) meters")

let threeFeet = 3.ft
print("Three feet is \(threeFeet) meters")