import UIKit
//protocolo de estrutura padrão da receita
protocol Recipe {
    var name: String { get }
    var type: String { get }
    var level: Double  { get }
}

//struct que recebe Receita
struct CakeRecipe: Recipe {
    let name: String
    let type: String
    let level: Double
    
    init(name: String, type: String, level: Double){
        self.name = name
        self.type = type
        self.level = level
    }
}

let cake = CakeRecipe(name: "Bolo de Chocolate", type: "Sobremesa", level: 3.5)
print("Receita: \(cake.name) \nTipo: \(cake.type) \nNível de dificuldade: \(cake.level) \n...............................................\n")

enum Ranking {
    case horrivel
    case tacomfomemesmo
    case dapraservirpravisista
    case magnifica
    
    func getScore() -> (Double, String) {
        switch self {
        case .horrivel:
            return (0.5 , "Comeu morreu!")
        case .tacomfomemesmo:
            return (3.5 , "Só pra quem tá passando fome!")
        case .dapraservirpravisista:
            return (6.5 , "Credo, mas fazer o quê!")
        case .magnifica:
            return (8.5 , "Dá pra servir pra visita!")
        default:
            return (10.0 , "Essa nem cachorro come!")
        }
    }
}

struct PieRecipe: Recipe {
    let name: String
    let type: String
    let level: Double
    let ranking: Ranking
    
    let scoreValue: Double
    let scoreText: String
    
    init(name: String, type: String, level: Double, ranking: Ranking){
        self.name = name
        self.type = type
        self.level = level
        self.ranking = ranking
        
        let (sValue, sText) = ranking.getScore()
        self.scoreValue = sValue
        self.scoreText = sText
    }
}

let pie = PieRecipe(name: "Torta de Legumes", type: "Snack", level: 6.6, ranking: .horrivel )
print("Receita: \(pie.name) \nTipo: \(pie.type) \nNível de dificuldade: \(pie.level) \nNota: \(pie.scoreValue) - \(pie.scoreText)\n...............................................\n")

struct IngredientsList {
    var ingredientsList: [(quantity: Int, unity: String, item: String)]

    init(ingredientsList: [(quantity: Int, unity: String, item: String)]) {
        self.ingredientsList = ingredientsList
    }
}

var ingrediente: [(Int, String, String)] = [(300, "gramas", "Arroz"),(20, "gramas", "Sal"), (1, "kilo", "de Frango")]
var ingredientes = IngredientsList(ingredientsList: ingrediente)
print("Ingredientes: \n\(ingrediente) \n...............................................\n")

struct ChickenPieRecipe: Recipe {
    let name: String
    let type: String
    let level: Double
    let ranking: Ranking
    var ingredients: IngredientsList
    
    
    let scoreValue: Double
    let scoreText: String
        
    init(name: String, type: String, level: Double, ranking: Ranking, ingredients: IngredientsList){
        self.name = name
        self.type = type
        self.level = level
        self.ranking = ranking
        self.ingredients = ingredients
        
        let (sValue, sText) = ranking.getScore()
        self.scoreValue = sValue
        self.scoreText = sText
    }
    
    // Função para calcular a quantidade total de itens
       func getTotalQuantity() -> Int {
           return ingredients.ingredientsList.count
       }
       
       // Função para calcular o peso total dos itens
       func getTotalWeight() -> String {
           let totalWeight = ingredients.ingredientsList.reduce(0) { $0 + $1.quantity }
           return "\(totalWeight) gramas"
       }
}

extension IngredientsList {
    mutating func convertKiloToGrams() {
        for (index, var ingredient) in ingredientsList.enumerated() {
            if ingredient.quantity == 1 && ingredient.unity.lowercased() == "kilo" {
                ingredient.quantity = 1000
                ingredient.unity = "gramas"
                ingredientsList[index] = ingredient
            }
        }
    }
}

var ingredients = IngredientsList(ingredientsList: [
    (400, "gramas", "Arroz"),
    (20, "gramas", "Sal"),
    (1, "kilo", "Frango")
])

ingredients.convertKiloToGrams()

let ckpie = ChickenPieRecipe(name: "Torta de Frango", type: "Snack", level: 6.5, ranking: .magnifica, ingredients: ingredients)
print("Receita: \(ckpie.name) \nTipo: \(ckpie.type) \nNível de dificuldade: \(ckpie.level) \nNota: \(ckpie.scoreValue) - \(ckpie.scoreText) \n\nIngredientes:\n")
      for ingredient in ckpie.ingredients.ingredientsList {
          print("Qtd: \(ingredient.quantity) \(ingredient.unity) de \(ingredient.item)")
      }
print("\nTotal de itens: \(ckpie.getTotalQuantity())")
print("Peso Total dos itens: \(ckpie.getTotalWeight())")
print("...............................................\n")

struct RecipeBook {
    var recipe = Recipe
    var ingredients = IngredientsList
}
