import UIKit

//Arrays são coleções ordenadas de valores
//Sets são coleções não ordenadas de valores únicos
//Dictionaries são coleções não ordenadas de associações de chaves-valores  "chave":"valor"


let myArray: [String] = []
//let myArray: Array<String> = []

var someInts: [Int] = []
print("someInts é do tipo [Int] com \(someInts.count) intes.")

someInts.append(3+4)
print(someInts)

someInts = []
print(someInts)

var threeDoubles = Array(repeating: 0.0, count: 3)
print(threeDoubles)

var anotherThreeDoubles = Array(repeating: 2.5, count:3)
var sixDoubles = threeDoubles + anotherThreeDoubles
print(sixDoubles)

var shoppingList: [String] = ["Ovos", "Leite"]
print("A lista de compras é: \(shoppingList)")
print("A lista de compras tem \(shoppingList.count) item(s)")

shoppingList.append("Banana")
shoppingList += ["Manteiga", "Jaca", "Cerveja", "Atemoia", "Mexiricas"]
print("A lista de compras é: \(shoppingList)")
print("A lista de compras tem \(shoppingList.count) item(s)")

var firstItem = shoppingList[0]
print(firstItem)

shoppingList[4...6] = ["Peras", "Cerejas"]
print("A lista de compras é: \(shoppingList)")
print("A lista de compras tem \(shoppingList.count) item(s)")

shoppingList.remove(at: 0)
print("A lista de compras é: \(shoppingList)")
print("A lista de compras tem \(shoppingList.count) item(s)")

let tangerina = shoppingList.removeLast()
print("A lista de compras é: \(shoppingList)")
print("A lista de compras tem \(shoppingList.count) item(s)")


for item in shoppingList {
    print(item)
}

for (index, value) in shoppingList.enumerated() {
    print("Item \(index + 1) contém \(value)")
}


//Sets


