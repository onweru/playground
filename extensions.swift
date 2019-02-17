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

let aMarathon = 42.km + 195.m
print("A marathon is \(aMarathon) meters long")

// extensions & initializers

struct Size {
  var width = 0.0, height = 0.0
}

struct Point {
  var x = 0.0, y = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
}

let defaultRect = Rect()
let memberwiseRect = Rect(origin: Point(x: 2.0, y: 2.0), size: Size(width: 5.0, height: 5.0))