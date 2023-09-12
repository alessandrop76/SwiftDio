import UIKit

// encapsulamento oculta atributos \ Abstração ocuta dados e métodos internos
// controles de acesso \ Open menos restrito \ Public semelhante ao open mas não pode ser herdada \ Internal acesso de qualquer lugar dentro do módulo \ File-Private permite o uso dentro do arquivo \ Private nível mais restritivo de todos

class Maths {
    let a: Int!  //o símbolo de ! exclamação significa que a variável é forced Warapped, sempre precisa ter um valor
    let b: Int!
    
    private var result: Int?  // result está encapsulado
    
    init(a: Int, b: Int) {
        self.a = a
        self.b = b
    }
    
    func add(){
        result = a + b
    }
    
    func displayResult(){
        print("Result = \(result ?? 0)")
    }
}

let calculation = Maths(a: 2, b: 3)
calculation.add()
calculation.displayResult()


open class OpenClass {
    open var age: Int = 23
    open func play(sport: String){}
}

public class PublicClass {
    public var age: Int = 23
    public func play(sport: String){}
}

internal class InternalClass {
    internal var age: Int = 23
    internal func play(sport: String) {}
}

fileprivate class FilePrivate {
    fileprivate var age: Int = 23
    fileprivate func play(sport: String) {}
}

private class PrivateClass {
    private var age: Int = 23
    private func play(sport: String){}
}

