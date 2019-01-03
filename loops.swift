let individualScores = [75, 43, 103, 87, 12]

var teamScore = 0

//  for in loop

for score in individualScores {
  if score > 50 {
    teamScore += 3
  } else {
    teamScore += 1
  }
}

print(teamScore)

// while loop

var counter = 0
let scoresCount = individualScores.count

while counter <  scoresCount {
  teamScore += individualScores[counter]
  counter += 1
}

print(teamScore)