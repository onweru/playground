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