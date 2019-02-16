let studentScores: [String: Int] = [
  "Fiona": 74,
  "Barrack": 33,
  "Owen": 96,
  "Carol": 56,
  "Dany": 97,
  "Greg": 87,
  "Juan": 67,
  "Joe": 46
]

for (student, score) in studentScores {
  switch score {
    case 0..<50: print("\(student) had a below average score")
    case 50...75: print("\(student) had a modest score")
    default: print("\(student) performed really well")
  }
}

// solve teamtreehouse closures challenge 1.1 and 1.2

func removeVowels(from oldString: String) -> String {
  var newString: String = ""
  for letter  in oldString.characters {
    switch letter {
      case "a", "e", "i", "o", "u", "A", "E", "I", "O", "U": break
      default: newString.append(letter)
    }
  }
  return newString
}

let sinVowels  = removeVowels(from: "Jambo Kenya")
print(sinVowels)