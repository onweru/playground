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

<?php 
/*
Template name: Front Page 
*/
?>

<?php get_header() ?>
			
<?php get_template_part('includes/front-feature') ?>

<!-- additional blocks -->
<div class="home-add clearfix">
	
	<!-- left -->
	<div class="left-home-block ">
		<?php get_template_part('includes/front-latest-posts') ?>
	</div>
	<!-- ENDS left -->
	
	<!-- right -->
	<div class="right-home-block">
		<?php get_template_part('includes/front-clients') ?>
		<?php get_template_part('includes/front-testimonials') ?>
	</div>
	<!-- ENDS right -->
	
</div>
<!-- ENDS additional blocks -->


<?php  get_template_part('includes/masthead') ?>
	
	<!-- posts list -->
	<div id="posts-list" class="clearfix">        	
		<?php get_template_part('includes/loop' ) ?>
		
		<!-- page-navigation -->
		<div class="page-navigation clearfix">
			<div class="nav-next"><?php  next_posts_link('&#8592; Older Entries') ?></div>
			<div class="nav-previous"><?php previous_posts_link('Newer Entries &#8594;') ?></div>
		</div>
		<!--ENDS page-navigation -->
	
	</div>
	<!-- ENDS posts list -->
	
	<?php get_sidebar() ?>

<?php get_footer() ?>