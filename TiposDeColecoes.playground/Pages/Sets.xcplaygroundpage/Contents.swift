import UIKit

//Arrays são coleções ordenadas de valores
//Sets são coleções não ordenadas de valores únicos
//Dictionaries são coleções não ordenadas de associações de chaves-valores  "chave":"valor"

//Sets

var letters = Set<Character>()
print("letters é do tipo Set<Character> com \(letters.count) item(s)")

letters.insert("a")
print("letters é do tipo Set<Character> com \(letters.count) item(s)")

letters = []
print("letters é do tipo Set<Character> com \(letters.count) item(s)")

var favoriteGenres: Set<String> = ["Rock","Hip-Hop","Pop"] //armazenará apenas valores tipo String - o tipo de conjunto deve ser declarado explicitamente

var newFavoriteGenres: Set = ["Rock","Hip-Hop","Pop"]  // forma abreviada para declarar o Set implicitamente
var concatenatedGenres = ""

favoriteGenres.insert("Jazz")

for item in favoriteGenres.sorted() {
   concatenatedGenres += "\(item), "
 }

playList()

func playList(){
    if !concatenatedGenres.isEmpty {
        concatenatedGenres.removeLast(2) //remove a virgula e o espaço
        print("Eu tenho \(favoriteGenres.count) gêneros musicais favoritos que são: \(concatenatedGenres)") //sortede deixa ordenado a saida
    }else {
        print("Eu não tenho gêneros musicais favoritos ainda")
    }
}

if let removedGenre = favoriteGenres.remove("Jazz") {
    print("\(removedGenre) não quero ouvir hoje")
}else {
    print("Não tenho essa playlist")
}

playList()

if !favoriteGenres.contains("Funk") {
    print("God Exists")
}else {
    print("Please help me")
}

//Operações em conjuntos com Set
let oddNumbers: Set = [1, 3, 5, 7, 9]
let evenNumbers: Set = [2, 4, 6 , 8]
let primeNumbers: Set = [1, 2, 3, 4, 5]

oddNumbers.union(evenNumbers).sorted()
evenNumbers.intersection(primeNumbers).sorted()
oddNumbers.subtracting(primeNumbers).sorted()
oddNumbers.subtracting(primeNumbers)
oddNumbers.symmetricDifference(primeNumbers).sorted()

let houseAnimals: Set = ["🐶", "🐩", "🐈", "🐈‍⬛", "🐓", "🐟"]
let farmAnimals: Set = ["🐶", "🐰", "🐴", "🐷", "🐩", "🐈", "🐈‍⬛", "🐓"]
let waterAnimals: Set = ["🐟", "🐬", "🐳", "🦈"]
let zooAnimals: Set = ["🐶", "🐰", "🐴", "🐷", "🐩", "🐈", "🐈‍⬛", "🐓", "🐟", "🐬", "🐳", "🦈"]

houseAnimals.union(farmAnimals).sorted()
houseAnimals.union(waterAnimals).sorted()
houseAnimals.union(zooAnimals).sorted()

zooAnimals.subtracting(farmAnimals)
zooAnimals.isSubset(of: farmAnimals)
zooAnimals.isSuperset(of: houseAnimals)
zooAnimals.isStrictSubset(of: waterAnimals)
zooAnimals.isDisjoint(with: houseAnimals)
zooAnimals.isStrictSubset(of: farmAnimals)
zooAnimals.isStrictSuperset(of: waterAnimals)
