let individualScores = [75, 43, 103, 87, 12]

var weighedScore = 0

//  for in loop

for score in individualScores {
  if score > 50 {
    weighedScore += 3
  } else {
    weighedScore += 1
  }
}

print(weighedScore)

// while loop

var counter = 0
var teamScore = 0
let scoresCount = individualScores.count

while counter <  scoresCount {
  teamScore += individualScores[counter]
  counter += 1
}

print(teamScore)

// repeat while loop

var anotherCounter = 0
var teamScores = 0

repeat {
  teamScores += individualScores[anotherCounter]
  anotherCounter += 1
} while anotherCounter <  scoresCount

print(teamScores)

<article class="format-standard">
			<div class="entry-date">
				<div class="number"><?php echo mysql2date('j', $recent["post_date"]) ?></div>
				<div class="month"><?php echo mysql2date('M', $recent["post_date"]) ?></div>
				<div class="year"><?php echo mysql2date('Y', $recent["post_date"]) ?></div>
				<em></em>
			</div>
			<div  class="post-heading">
				<h5><a href="<?php echo get_permalink($recent["ID"]) ?>"><?php echo $recent["post_title"] ?> </a></h5>
			</div>
			<div class="excerpt"><?php echo $recent["post_excerpt"]?></div>
		</article>