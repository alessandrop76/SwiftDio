import UIKit

enum PrinterError: Error {
    case outOfPaper
    case noToner
    case onFire
}

func send(job: Int, toPrinter printerName: String) throws -> String{
    if printerName == "Não possui toner" {
        throw PrinterError.noToner
    }
    return "Trabalho enviado"
}
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFounds(coinsNeeded: Int)
    case outOfStock
}
struct Item {
    var price: Int
    var count: Int
    }

class VendingMachine {
    var inventory = [
    "Candy Bar": Item(price: 10, count: 4),
    "Soda": Item(price: 5, count: 0),
    "Snack": Item(price: 2, count: 1),
    "Chocolate Bar": Item(price: 8, count: 17),
    ]

    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }
        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }
        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFounds(coinsNeeded: item.price - coinsDeposited)
        }
    
    coinsDeposited -= item.price
    
    var newItem = item
    newItem.count -= 1
    inventory[name] = newItem
    
    print("Distribuição \(name)")
    
    }
}

let vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 1

//try vendingMachine.vend(itemNamed: "Candy Bar")

do {
    let printerReponse = try send(job: 1040, toPrinter: "Não possui toner")
    print(printerReponse)
}catch {
    print(error)
}

do {
    let printerReponse = try send(job: 1040, toPrinter: "Fotos da praia")
    print(printerReponse)
} catch PrinterError.onFire {
    print("Pegou fogo na impressora")
} catch let printerError as PrinterError {
    print(printerError)
} catch {
    print(error)
}

var avendingMachine = VendingMachine()
avendingMachine.coinsDeposited = 8
func nourish(with item: String) throws {
    do {
        try avendingMachine.vend(itemNamed: item)
    } catch is VendingMachineError {
        print ("Não foi possível comprar isso na máquina de venda automática")
    }
}
do {
    try nourish(with: "Chips com sabor beterraba")
} catch{
    print ("Erro inesperado : \(error)")
}

let printerSuccess = try? send(job: 1884, toPrinter: "Memorando")
let printerFailure = try? send(job: 299, toPrinter: "Não possui toner")

var fridgeIsOpen = false
let fridgeContent = ["leite", "ovo", "sobras"]
func fridgeContains(_ food: String) -> Bool {
    fridgeIsOpen = true
    
    defer {
        fridgeIsOpen = false
    }
    
    let result = fridgeContent.contains(food)
    return result
}

fridgeContains("ovo")
print(fridgeIsOpen)
