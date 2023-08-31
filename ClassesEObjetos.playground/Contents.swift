import UIKit

//Classes
//Objetos

class Shape { //padrão ao nomear a classe sempre iniciando com letra Maiúscula
    var numberOfSides = 0
    func simplesDescription() -> String {
        return "Uma forma com \(numberOfSides) lados."
    }
}

var shape = Shape()
shape.numberOfSides = 7
var shapedDescription = shape.simplesDescription()

class NamedShape {
    var numbersOfSide: Int = 0
    var name: String
    
    init(name: String){
        self.name = name
    }
    
    func simplesDescription() -> String {
        return "Uma nova forma com \(numbersOfSide) lados."
    }
}


class Square : NamedShape {//  esta classe está usando a Superclasse NamedShape
    //ao reinscrever os métodos é necessário usar 'override'
    var sideLenght: Double
    
    init(sideLenght: Double, name: String) {
        self.sideLenght = sideLenght
        super.init(name: name)
        numbersOfSide = 4
    }
    
    func area() -> Double {
        return sideLenght * sideLenght
    }
    
    override func simplesDescription() -> String {
        return "Um quadrade com lados de comprimento \(sideLenght)"
    }
    
}

let test = Square(sideLenght: 5.2, name: "meu quadrado de teste")
test.area()
test.simplesDescription()
test.numbersOfSide


class EquilateralTriangle: NamedShape {// criamos essa classe que usa o comportamento da superclasse
    
    var sideLength: Double = 0.0  //uma variável tipo double
    
    var perimeter: Double {// uma variável do tipo get/set tipada Double
        get { return 3.0 * sideLength }
        set { sideLength = newValue / 3.0 } //o nome de newValue está definido implicitamente, pode ser declarado explicitamente
        
        //podemos caso necessário usar os observadores: willSet e didSet
    }
    
    init(sideLength: Double, name: String){
        self.sideLength = sideLength
        super.init(name: name)
        numbersOfSide = 3
    }
    
    override func simplesDescription() -> String {
        return "Um triângulo equilátero com lados de comprimento \(sideLength)"

    }
}

var triangle = EquilateralTriangle(sideLength: 3.1, name: "um triângulo")
print(triangle.perimeter) //aqui estamos fazendo o get da var perimetro
triangle.perimeter = 9.9  //aqui estamos fazendo o set da var perimetro
print(triangle.sideLength)
print(triangle.numbersOfSide)


class TriangleSquare {
    var triangle: EquilateralTriangle {
        willSet{
            triangle.sideLength = newValue.sideLength
        }
    }
    
    var square: Square {
        willSet{
            triangle.sideLength = newValue.sideLenght
        }
    }
    
    init(size: Double, name: String) {
        square = Square(sideLenght: size, name: name)
        triangle = EquilateralTriangle(sideLength: size, name: name)
    }
}

var triangleAndSquare = TriangleSquare(size: 10, name: "um outro triângulo")
print(triangleAndSquare.square.sideLenght)
print(triangleAndSquare.triangle.sideLength)
triangleAndSquare.square = Square(sideLenght: 50, name: "Nova medida do quadrado")
print(triangleAndSquare.square.name, triangleAndSquare.square.sideLenght)

//quando recebemos um opcional caso seja desembrulhado todo o codigo será executado, caso seja nil todo o código será ignorado

let optionalSquare: Square? = Square(sideLenght: 2.5, name: "Quadrado Opcional")
let sideLength = optionalSquare?.sideLenght

print(optionalSquare?.sideLenght)

