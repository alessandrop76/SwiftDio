import UIKit


class Person {
    var age: Int!
    var gender: String!
    var color: String!
    var maritalStatus: String!
}

class BehaviorPerson {
    var age: Int!
    var gender: String!
    var color: String!
    
    func play(sport: String){
        //escreva como a pessoa irá jogar
    }
}

class Wall {
    init(){
        //execute sua inicialização
    }
}

class WhiteWall {
    var length:  Double
    
    init() {
        length = 5.5
        print("Criamos o objeto wall")
        print("Length whiteWall = ", length)
    }
}

var whiteWall = WhiteWall()

class BlackWall {
    var length: Double
    
    init(length: Double) {
        self.length = length
        print("Length blackWall = ", length)
    }
}

var blackWall = BlackWall(length: 10.5)

class LongWall {
    var length: Double
    var heigth: Double
     
    init(length: Double, height: Double) {
        self.length = length
        self.heigth = height
        print("A área é \(calculateArea())")
    }
    
    func calculateArea() -> Double {
        return length * heigth
    }
}

var longWall = LongWall(length: 2.5, height:  4.5)

var longWall2 = LongWall(length: 5.6, height: 6.5)


class PersonAge {
    var age: Int
    
    init() {
        age = 20
    }
    
    init(age: Int) {
        self.age = age
    }
    
    func getAge() -> Int {
        return age
    }
}

var personAge1 = PersonAge()
print("Person age 1 = ", personAge1.getAge())

var personAge2 = PersonAge(age: 30)
print("Person age 2 = ", personAge2.getAge())

// inicializador de conveniência

class University {
    var name: String
    var rank: String
    
    init(name: String, rank: String) {
        self.name = name
        self.rank = rank
    }
    
    convenience init(){
        self.init(name: "Universidade São Paulo", rank: "1º")
    }
}

var university = University()
print(university.name)
print("Rank: " ,university.rank)


class File {
    var folder: String
    
    init?(folder: String){
        if folder.isEmpty{
            print("Folder Not Found")
            return nil
        }
        
        self.folder = folder
    }
}

var file = File(folder: "Pasta")
if file != nil {
    print("Arquivo foi encontrado com sucesso")
}else{
    print("Erro ao buscar o arquivo")
}

struct PersonStruct {
    var name : String
    var age: Int
}

var personStruct = PersonStruct(name: "Peter", age: 15)
print(personStruct.age, personStruct.name)

