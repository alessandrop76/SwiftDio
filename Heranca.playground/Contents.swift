import UIKit

class Person {
    var age: Int
    var gender: String
    var color: String
    var maritalStatus: String
    
    init(age: Int, gender: String, color: String, maritalStatus: String){
        self.age = age
        self.gender = gender
        self.color = color
        self.maritalStatus = maritalStatus
    }
    
    func play(sport: String) {
        print("Esporte: \(sport)")
    }
    
    //oveerload - sobrecarregamos o método play
    func play(instrument: String) {
        print("Instrumento: \(instrument)")
    }
    
}

class Men: Person{
    
}

let andy = Men(age: 20, gender: "male", color: "white", maritalStatus: "marrid")

print(andy.age, andy.gender, andy.color, andy.maritalStatus)
andy.play(sport: "football")
andy.play(instrument: "guitar")

class FootballPlayer: Person{
    
    override func play(sport: String){   //sobrescreve o método play
        print("Jogador de: \(sport)")
    }
}

let footballPlayer = FootballPlayer(age: 45, gender: "female", color: "black", maritalStatus: "single")

let sindy = footballPlayer

print(sindy.age, sindy.gender)
sindy.play(sport: "squash")
sindy.play(instrument: "drums")


class Pilot: Person{
    
    override func play(sport: String){
        print("Pratrica: \(sport)")
    }
}

let pilot = Pilot(age: 40, gender: "male", color: "black", maritalStatus: "single")

pilot.play(sport: "Formula 1")

print(pilot.age, pilot.gender)
pilot.play(sport: "Nascar")

