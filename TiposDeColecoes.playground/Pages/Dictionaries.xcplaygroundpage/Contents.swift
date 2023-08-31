import UIKit

//Arrays são coleções ordenadas de valores
//Sets são coleções não ordenadas de valores únicos
//Dictionaries são coleções não ordenadas de associações de chaves-valores  "chave":"valor"


//Dictionaries

var namesOfIntegers: [Int: String] = [:]
namesOfIntegers[16] = "Dezesseis"
namesOfIntegers = [:]

var airports: [String : String] = ["YYZ" : "Totonto Pearson", "DUB" : "Doublin"]
var literalAirports = ["YYZ" : "Totonto Pearson", "DUB" : "Doublin"]

print("O dicionário de aeroportos contém \(airports.count) item(s)")

if airports.isEmpty {
    print("O dicionário de aiports está vazio")
}else {
    for item in airports{
        var airport = "\(item), "
        print(airport)
    }
}


airports["LHR"] = "London"
airports["LHR"] = "London Heathrow"
airports["GRU"] = "Guarulhos"

if let oldValue = airports.updateValue("Doublin Airpoint", forKey: "DUB") {
    print("O valor antigo de DUB era \(oldValue)")
}

if let airportName = airports["GRU"] {
    print("O nome do aeroporto é \(airportName)")
}else {
    print("Esse aeroporto \(airports) não está no dicionário de aeroportos")
}

airports["APL"] = "Apple International"
airports["APL"] = nil

if let removeValue = airports.removeValue(forKey: "DUB") {
    print("O nome do aeroporto removido é \(removeValue)")
} else {
    print("O dicionário de aeroportos não contém um valor para DUB")
}

for (airportCode, airportName) in airports {
    print("\(airportCode): \(airportName)")
}

for airportCode in airports.keys {
    print("O código do Aeroporto é: \(airportCode)")
}

for airportName in airports.values {
    print("O nome do Aeroporto é: \(airportName)")
}
