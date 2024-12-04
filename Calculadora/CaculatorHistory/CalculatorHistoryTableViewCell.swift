//
//  CalculatorHistoryTableViewCell.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

class CalculatorHistoryTableViewCell: UITableViewCell {

    
    @IBOutlet weak var background: UIView!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var valorALabel: UILabel!
    @IBOutlet weak var valorBLabel: UILabel!
    @IBOutlet weak var operacaoLabel: UILabel!
    @IBOutlet weak var resultadoLabel: UILabel!
    @IBOutlet weak var dataLabel: UILabel!
    
    func setupCell(count: Calculation){
        background.setCornerRadius(cornesRadius: 12, typeCorners:[.inferiorDireito, .inferiorEsquerdo, .superiorDireito, .superiorEsquerdo])
        idLabel.text = "ID: \(count.id)"
        valorALabel.text = "Primeiro valor: \(count.valorA)"
        valorBLabel.text = "Segundo valor: \(count.valorB)"
        operacaoLabel.text = "Operação escolhida: \(count.operacao)"
        resultadoLabel.text = "Resultado: \(count.resultado)"
        dataLabel.text = count.data.formatToString()
    }

}
