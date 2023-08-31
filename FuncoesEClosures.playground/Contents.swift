import UIKit

func greet(person: String, day:String) -> String { //label está sendo enviada como parâmetro
    //Bloco da função
    return "Olá \(person), hoje é dia \(day)"
}
greet(person: "José", day:"Terça-Feira")

func greet(_ person: String, on day: String) -> String {// a label está sendo omitida
    return "Olá \(person) hoje é \(day)"
}
greet("Jhon", on: "Quarta-Feira")

func calculateStatistics(scores: [Int]) -> (min: Int, max: Int, sum: Int) {
    var min = scores[0]
    var max = scores[0]
    var sum = 0

    for score in scores {
        if score > max {
            max = score
        } else if score < min{
            min = score
        }
        sum += score
    }
    
    return (min, max, sum)
}

let stastistics = calculateStatistics(scores: [5, 3, 100, 9])
print(stastistics.min)
print(stastistics.max)
print(stastistics.sum)
print (stastistics.2) //imprime statistics.sum que é o terciero parâmetro


func returnFifteen() -> Int {
    var y = 10
    
    func add() {
        y += 5
    }
    add()
    
    return y
}

returnFifteen()


func makeIncrementer() -> ((Int) -> Int) {
    func addOne(number: Int) -> Int {
        return 1 + number
    }
    return addOne
}
var increment = makeIncrementer()
print("O retorno da função addOne que está dentro da função makeIncrementer é a soma do parâmetro Inteiro 7 mais seu retorno que ó o incremento de + 1 totalizando : \(increment(7))")

func hasAnyMatches(list: [Int], condition: (Int) -> Bool) -> Bool {
    for item in list {
        if condition(item){
            return true
        }
    }
    return false
}

func lessThanTeen(number: Int) -> Bool {
    return number < 10
}

var numbers = [20, 19, 7, 12]
hasAnyMatches(list: numbers, condition: lessThanTeen)
//a função está verificando se dentro da lista numbers tem um numero menor que 10
//através da função lessThanTeen, e retorna um booleano

let mapNum = numbers.map({(number: Int) -> Int in
    let result = 3 * number
    return result
})
print(mapNum)

let mappedNumbers = numbers.map({ number in 4 * number })
print(mappedNumbers)


//closure passada como último argumento de uma função
let sortedNumbers = numbers.sorted{$0 > $1}
print(sortedNumbers) // ordena a saída da lista do maior para o menor
