import UIKit

class Player {
    let name: String
    
    init(name: String){
        self.name = name
    }
    
    func play(){
        
    }
}

class Bastman: Player {
    override func play() {
        Bat()
    }
    
    func Bat(){
        print("\(name) está lançando a bola")
    }
}
    
    class Bowler: Player {
        override func play() {
            Bowler()
        }
        
        func Bowler(){
            print("\(name) está rebatendo a bola")
        }
    }
    
    class TeamCricket {
        let name: String
        let team: [Player]
        
        init(name: String, team: [Player]){
            self.name = name
            self .team = team
        }
        
        func play(){
            team.forEach{ $0.play() }
        }
    }
    
let maria = Bastman(name: "Maria")
let pedro = Bowler(name: "Pedro")
let teamCricket = TeamCricket(name: "Time De Cricket", team: [maria, pedro])

teamCricket.play()


