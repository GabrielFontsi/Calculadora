//
//  Calculation.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import Foundation

class Calculation {
    
    var valorA: String
    var valorB: String
    var resultado: String
    var id: Int
    var operacao: String
    var data: Date
    
    init(valorA: String, valorB: String, resultado: String, id: Int, operacao: String, data: Date) {
        self.valorA = valorA
        self.valorB = valorB
        self.resultado = resultado
        self.id = id
        self.operacao = operacao
        self.data = data
    }
    
    
}
