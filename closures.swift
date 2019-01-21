let names = ["Mogg", "Reed", "Kyler", "Greg", "Owen"]

// example 1
func backward(_ s1: String, _ s2: String) -> Bool {
  return s1 > s2
}

var  revervedNames = names.sorted(by: backward)

print(revervedNames)
