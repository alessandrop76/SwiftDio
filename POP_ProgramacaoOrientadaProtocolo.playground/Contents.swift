import UIKit

//no exemplo abaixo através dos protocolos podemos utilizar Heranças múltiplas (o que não seria possível utilizando Classes)
protocol Bird: CustomStringConvertible {
    var name: String { get }
    var canFly: Bool { get }
    
}
protocol Flyable {
    var maximumSpeed: Double { get }
}

struct Parrot: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    let canFly: Bool = true
    
    var maximumSpeed: Double {
        3 * amplitude * frequency
    }
}

let parrot = Parrot(name: "Lôro", amplitude: 12.5, frequency: 5.3)
print("O \(parrot.name) consegue voar a \(parrot.maximumSpeed) Km/h")

struct Penguin: Bird {
    let name: String
    let canFly: Bool = false
}

let penguin = Penguin(name: "Pinguim de geladeira")
print("O \(penguin.name) é um passáro que vôa ? \(penguin.canFly ? "Sim ele voa" : "Não o pinguim não voa")")

extension Bird {
    var canFly: Bool { self is Flyable}
}

struct Dove: Bird, Flyable {
    let name: String
    let amplitude: Double
    let frequency: Double
    
    var maximumSpeed: Double {
        4 * amplitude * frequency
    }
}

struct Ostrich: Bird {
    let name: String
}

let dove = Dove(name: "UPombo", amplitude: 6.5, frequency: 3.99)
print( "O \(dove.name) conseuge voar ? \(dove.canFly ? "Claro, e atinge uma velocidade de \(dove.maximumSpeed) km/h " : "Não, ele não voa")" )

let ostrich = Ostrich(name: "O Avestruz")
print("O \(ostrich.name) pode voar? \(ostrich.canFly ? "Sim ele consegue voar" : "Não ele não sai do chão")")

enum Swallow : Bird, Flyable { //aqui está sendo usado a implementação padrão canFly
    case affrican
    case european
    case unknown
    
    var name: String {
        switch self {
        case .affrican:
            return "Andorinha Africana"
        case .european:
            return "Andorinha Européia"
        case .unknown:
            return "Andorinha desconhecida"
        }
    }
        
        var maximumSpeed: Double {
            switch self {
            case .affrican:
                return 10.5
            case .european:
                return 9.2
            case .unknown:
                fatalError("Não sabemos a velocidade deste pássaro")
            }
        }
}

extension Swallow {
    
    var canFly: Bool {
        self != .unknown
    }
}

Swallow.unknown.canFly
Swallow.affrican.canFly
Penguin(name: "Pinguim").canFly

extension CustomStringConvertible where Self: Bird { //implementação padrão
    var description: String {
        canFly ? "Sim, pode voar" : "Não, não pode voar"
    }
}

print(Swallow.affrican)
print(Swallow.unknown)


class Motorcycle {
    var name: String
    var speed: Double
    
    init(name: String){
        self.name = name
        speed = 200.00
    }
}

protocol Racer {
    var speed: Double { get }
}

extension Parrot: Racer {
    
    var speed: Double {
        maximumSpeed
    }
}

extension Penguin: Racer {
    
    var speed: Double {
        42
    }
}

extension Swallow: Racer {
    
    var speed: Double {
        canFly ? maximumSpeed : 0.0
    }
}

extension Motorcycle: Racer {}


let racers: [Racer] = [
    Swallow.affrican,
    Swallow.european,
    Swallow.unknown,
    Penguin(name: "Pinguim"),
    Parrot(name: "Lôro", amplitude: 13.8, frequency: 7.2),
    Motorcycle(name: "Alex Barros")
]

func topSpeed(of racers: [Racer]) -> Double {
    racers.max(by: { $0.speed < $1.speed})?.speed ?? 0.0
}

print("Velocidade máxima entre os pilotos \(topSpeed(of: racers))")

extension Sequence where Iterator.Element == Racer {
    func topSpeed() -> Double {
        self.max(by: {$0.speed < $1.speed})?.speed ?? 0.0
    }
}

print("Velocidade máxima dos pilotos \(racers.topSpeed())")
print("Velocidade máxima entre os 3 priemeiros pilotos \(racers[1...3].topSpeed())")


protocol Cheat {
    mutating func boost(_ power: Double)
}

struct SwiftBird: Bird, Flyable {
    var name: String {"Swift \(version)"}
    let version: Double
    
    private var speedFactor = 1000.00
    
    var maximumSpeed: Double {
        version * speedFactor
    }
    
    init(version: Double){
        self.version = version
    }
    
}

extension SwiftBird: Cheat {
    
    mutating func boost(_ power: Double) {
        speedFactor += power
    }
}

var swiftBird = SwiftBird(version: 5.0)
print("Velocidade igual \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade igual \(swiftBird.maximumSpeed)")
swiftBird.boost(3.0)
print("Velocidade igual \(swiftBird.maximumSpeed)")
