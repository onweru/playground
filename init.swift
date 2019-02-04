// Failable initializer
struct Animal {
  let species: String
  init?(species: String) {
    if species.isEmpty { return nil }
    self.species = species 
  }
}

let someCreature = Animal(species: "Giraffe")

if let giraffe = someCreature {
  print("An animal was initialized with a species of \(giraffe.species)")
}
