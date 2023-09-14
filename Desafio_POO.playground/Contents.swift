import UIKit

/*
 - Criar 2 projetos
 - 1º Usar paradigma de Programação Orientada a Objetos
 - 2º Usar paradigma de Programação Orientada a Protocolos
 Para ambos os projetos explorar os conceitos:
 - Controle de Fluxos
 - Coleções
 - Funções e Closures
 - Enuns e Structs
 - Concorrências
 */

// Enum para representar o status do pagamento
enum PaymentStatus {
    case paid
    case unpaid
}

// Struct para representar uma assinatura de serviço de streaming
struct Subscription {
    let serviceName: String
    let username: String
    let password: String
    let monthlyCost: Double
    let subscriptionDuration: Int // Em meses
    var paymentStatus: PaymentStatus

    // Método para calcular o custo total durante a duração da assinatura
    func totalCost() -> Double {
        return monthlyCost * Double(subscriptionDuration)
    }
}

// Classe para gerenciar todas as assinaturas
class SubscriptionManager {
    var subscriptions: [Subscription] = []

    // Método para adicionar uma nova assinatura
    func addSubscription(_ subscription: Subscription) {
        subscriptions.append(subscription)
    }

    // Método para listar todas as assinaturas
    func listSubscriptions() {
        for (index, subscription) in subscriptions.enumerated() {
            print("Assinatura \(index + 1):")
            print("Serviço: \(subscription.serviceName)")
            print("Usuário: \(subscription.username)")
            print("Senha: \(subscription.password)")
            print("Mensalidade: R$\(subscription.monthlyCost)")
            print("Duração: \(subscription.subscriptionDuration) meses")
            print("Status do pagamento: \(subscription.paymentStatus == .paid ? "Pago" : "Não pago")")
            print("Custo total: R$\(subscription.totalCost())")
            print("=======================")
        }
    }
}

class ListByPrice {
    func listSubscriptionsByPrice(_ subscriptions: [Subscription]) {
        let sortedSubscriptions = subscriptions.sorted { $0.totalCost() < $1.totalCost() }
        
        for (index, subscription) in sortedSubscriptions.enumerated() {
            print("Assinatura \(index + 1):")
            print("Serviço: \(subscription.serviceName)")
            print("Usuário: \(subscription.username)")
            print("Senha: \(subscription.password)")
            print("Mensalidade: R$\(subscription.monthlyCost)")
            print("Duração: \(subscription.subscriptionDuration) meses")
            print("Status do pagamento: \(subscription.paymentStatus == .paid ? "Pago" : "Não pago")")
            print("Custo total: R$\(subscription.totalCost())")
            print("=======================")
        }
    }
}


// Exemplo de uso
let netflix = Subscription(serviceName: "Netflix", username: "usuario1", password: "senha1", monthlyCost: 15.99, subscriptionDuration: 12, paymentStatus: .paid)
let spotify = Subscription(serviceName: "Spotify", username: "usuario2", password: "senha2", monthlyCost: 9.99, subscriptionDuration: 6, paymentStatus: .unpaid)
let hbomax = Subscription(serviceName: "HBO Max", username: "usuario3", password: "senha3", monthlyCost: 7.99, subscriptionDuration: 12, paymentStatus: .paid)

let subscriptionManager = SubscriptionManager()

subscriptionManager.addSubscription(netflix)
subscriptionManager.addSubscription(spotify)
subscriptionManager.addSubscription(hbomax)

subscriptionManager.listSubscriptions()

let subscripts = [netflix, spotify, hbomax]
let listByPrice = ListByPrice()
listByPrice.listSubscriptionsByPrice(subscripts)
