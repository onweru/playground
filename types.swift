// variable
var counter = 0
// constant
let start = 42

// 1. NUMBERS

let implicitInteger = 36
let explicitInteger: Int = 36

let implicitDouble = 36.0
let explicitDouble: Double = 36.0


// 2. STRINGS

let firstName = "Dan"
let lastName = "Weru"
let age = 26

// string concatenation

let fullName = firstName + " " + lastName
let greeting = "Hello there, I'm \(fullName)."

// change number to string

let myAge = String(age)


// multi-line string

let quotation = """
  This quotation starts
  ...
  and continues
  """

// 3. ARRAYS

var shoppingList = ["coriander", "carrots", "tomatoes", "french beans"]

var emptyArray = [String]()

// 4. DICTIONARIES

var technologies = [
  "web": "javascript",
  "android": "kotlin",
  "ios": "swift",
  "machine learning": "python"
]

var emptyDictionary = [String: Float]()

// add item to dictionary

technologies["databases"] = "SQL"

print(technologies)