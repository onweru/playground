// computed properties

struct Point {
  var x = 0.0
  var y = 0.0
}

struct Size {
  var width = 0.0
  var height = 0.0
}

struct Rect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY) 
    }

    set(newCenter) {
      origin.x = newCenter.x - (size.width / 2)
      origin.y = newCenter.y - (size.height / 2)
    }
  }

  var area: Double {
    get {
      let area = size.width * size.height;
      return area
    }
  }
}


var square = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 10.0))
print("The initial square center is now at (\(square.center.x), \(square.center.y))")

let initialSquareCenter = square.center
square.center = Point(x: 15.0, y: 15.0)
print("The square origin is now at (\(square.origin.x), \(square.origin.y))")

let newArea = square.area
print("New Area is \(newArea)") 

// setter using short hand
struct alternativeRect {
  var origin = Point()
  var size = Size()
  var center: Point {
    get {
      let centerX = origin.x + (size.width / 2)
      let centerY = origin.y + (size.height / 2)
      return Point(x: centerX, y: centerY) 
    }

    set {
      // notice we're using a newValue
      origin.x = newValue.x - (size.width / 2)
      origin.y = newValue.y - (size.height / 2)
    }
  }
}


var rectangle = Rect(origin: Point(x: 0.0, y: 0.0), size: Size(width: 10.0, height: 20.0))
print("The initial rectangle center is now at (\(rectangle.center.x), \(rectangle.center.y))")

let initialRectangleCenter = rectangle.center
rectangle.center = Point(x: 15.0, y: 25.0)
print("The rectangle origin is now at (\(rectangle.origin.x), \(rectangle.origin.y))")
