let names = ["Mogg", "Reed", "Kyler", "Greg", "Owen"]

// example 1
func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var  revervedNames = names.sorted(by: backward)

print(revervedNames)

// example 2 ~ (somewhat more concise)

revervedNames = names.sorted(by: {(s1: String, s2: String) -> Bool in return s1 > s2})

print(revervedNames)

// example 3 ~ (variation of #3)

let locations = ["Nairobi", "Arusha", "Tunis", "Moscow", "Tel Aviv"]
 
var arrangedLocations = locations.sorted(by: {(locale1, locale2) -> Bool in return locale1 < locale2})
print(arrangedLocations)


// example 4 ~ closure with inferred types

var reversedLocations = locations.sorted(by: { locale1, locale2 in return locale1 > locale2 })

print(reversedLocations)

// example 5 ~ closure with an implicit return

reversedLocations = locations.sorted(by: { locale1, locale2 in locale1 > locale2 })

print(reversedLocations)

// example 6 ~ closure using a shorthand

let languages = ["Javascript", "Swift", "Golang", "CSS", "C#"]

var arrangedLanguages = languages.sorted(by: { $0 < $1 })

print(arrangedLanguages)

// example 7 ~ closure using operator

var reversedLanguages = languages.sorted(by: > )
print(reversedLanguages)