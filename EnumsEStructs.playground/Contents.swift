import UIKit

//enums podem ter métodos associados a ele
//structs recebem muitos dos comportamentos das classes inclusive métodos e inicializadores


enum Rank: Int {
    case ace = 1
    case two, three, four, five, six, seven, eight, nine, ten
    case jack, queen, king
    
    func simpleDescription() -> String {
        switch self {
        case .ace:
            return "ace"
        case .jack:
            return "jack"
        case .queen:
            return "queen"
        case .king:
            return "king"
        default:
            return String(self.rawValue)
            
        }
    }
}

let ace = Rank.ace
let aceRawValue = ace.rawValue

if let convertedRank = Rank(rawValue: 1) {
    let threeDescription = convertedRank.simpleDescription()
}

enum Suit {
    case spades, hearts, diamonds, clubs
    func simpleDescription() -> String {
        switch self {
        case .spades:
            return "spades"
        case .hearts:
            return "hearts"
        case .diamonds:
            return "diamonds"
        case .clubs:
            return "clubs"
        }
    }
}
let hearts = Suit.hearts
let heartsDescription = hearts.simpleDescription()

//exemplo
enum ServerResponse {
    case result(String, String)
    case failure(String)
}

let success = ServerResponse.result("06:00 am", "5:59 pm")
let failure = ServerResponse.failure("Fora do intervalo")

switch failure{
case let .result(sunrise, sunset):
    print("O nascer do sol é as \(sunrise) e o poente é as \(sunset)")
case let .failure(message):
    print("A resposta falhou: \(message)")
}


//Structs -

struct Card {
    var rank: Rank
    var suit: Suit
    
    func simpleDescription() -> String {
        return "O \(rank.simpleDescription()) do \(suit.simpleDescription)"
    }
}

let threeOfSpades = Card(rank: .three, suit: .spades)
let threeOfSpadesDescription = threeOfSpades.simpleDescription()

