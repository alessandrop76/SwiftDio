import UIKit

let individualScores = [75, 43, 103, 87, 12]

var teamScore = 0

for score in individualScores {
    if score > 50 {
        teamScore += 3
    }else{
        teamScore += 1
    }
}

print(teamScore)

var optinalString : String? = "Olá"

print(optinalString == nil)

var optionalName: String? = "33"
var greeting = "Olá muito prazer, qual o seu nome?"

if let name = optionalName {
    greeting = "Olá, \(name)"
}

let nickName: String? = "NickJhon" //=nil

let fullName: String = "Jhon of God"
let informalGreeting = "E aê \(nickName ?? fullName)"

if let nickName {
    print("Fala, \(nickName)")
}


//Switch

let vegetable = "pimentão vermelho"

switch vegetable {
case "salsão":
    print("Adicione algumas uvas passas")
case "pepino", "agrião":
    print("Isso daria um bom sanduíche")
case let x where x.hasPrefix("pimentão"): // aqui o case está sendo atribuído a 'x' e procura pelo prefixo pimentão para validar
    print("é picante \(x)?")
default:
    print("Tudo vai bem na sopa.")
    
}
    
    
let interestingNumbers = [
    "Melhor" : [2, 3, 5, 7, 11, 13],
    "Fibonacci": [1, 1, 2, 3, 5, 8],
    "Quadrado": [1, 4, 9, 16, 25],
]

var largest = 0

//gerando uma tupla
for (_, numbers) in interestingNumbers {
    for number in numbers {
        if number > largest {
            largest = number
        }
    }
}

print(largest)


var n = 2
while n < 100 {
    print(n)
    n += 2
    }
print(n)

var m = 2
repeat {
    m *= 2
}while m < 100
print(m)


var total = 0
for i in 0..<4 {
    total += i
}
print(total)


//while | repeat | for i
