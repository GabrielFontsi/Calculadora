//
//  CalculateViewController.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

class CalculateViewController: UIViewController {
    
    private var calculateScreen = CalculateScreen()
    private var count: [Count] = []
    private var currentId: Int = 0
    
    override func loadView() {
        self.view = self.calculateScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNavigationBar()
        self.setupNavegationItem()
        self.calculateScreen.delegate(delegate: self)
        self.calculateScreen.configTextFieldDelegate(delegate: self)
    }
    
    private func setupNavegationItem(){
        let historyButton = UIBarButtonItem(title: "Ver Histórico", style: .done, target: self, action: #selector(historyTapped))
        navigationItem.rightBarButtonItem = historyButton
        navigationItem.rightBarButtonItem?.tintColor = .white
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        title = "Calculadora"
    }
    
    @objc private func historyTapped(){
        let historyViewController = CalculatorHistoryViewController(counts: count)
        navigationController?.pushViewController(historyViewController, animated: true)
    }
    
}

extension CalculateViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}

extension CalculateViewController: CalculateScreenProtocol {
    func actionEqualButton() {
        
        guard let valorA = calculateScreen.valueATextField.text,
              let valorB = calculateScreen.valueBTextField.text,
              let valor1 = Double(valorA),
              let valor2 = Double(valorB) else {
            showAlert(message: "Por favor, insira valores válidos.")
            return
        }
        
        var resultado: String
        let operacao = calculateScreen.currentOperation
        
        switch operacao {
        case "+":
            resultado = formatNumber(valor1 + valor2)
        case "-":
            resultado = formatNumber(valor1 - valor2)
        case "*":
            resultado = formatNumber(valor1 * valor2)
        case "/":
            if valor2 != 0 {
                resultado = formatNumber(valor1 / valor2)
            } else {
                showAlert(message: "Divisão por zero não permitida.")
                return
            }
        default:
            showAlert(message: "Operação inválida.")
            return
        }
        
        
        currentId += 1
        let id = currentId
        let data = Date()
        
        let conta = Count(valorA: valorA, valorB: valorB, resultado: resultado, id: id, operacao: operacao, data: data)
        count.append(conta)
        
        showSuccessAlert()
        
        calculateScreen.resultTextField.text = " Resultado da última operação: \(resultado)"
        calculateScreen.valueATextField.text = ""
        calculateScreen.valueBTextField.text = ""
        calculateScreen.operationTextField.text = ""
    }
    
    func actionAdditionButton() {
        calculateScreen.currentOperation = "+"
        calculateScreen.operationTextField.text = "+"
    }
    
    func actionSubtractionButton() {
        calculateScreen.currentOperation = "-"
        calculateScreen.operationTextField.text = "-"
    }
    
    func actionMultiplicationButton() {
        calculateScreen.currentOperation = "*"
        calculateScreen.operationTextField.text = "*"
    }
    
    func actionDivisionButton() {
        calculateScreen.currentOperation = "/"
        calculateScreen.operationTextField.text = "/"
        
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Erro", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
    func showSuccessAlert() {
        let alert = UIAlertController(title: "Sucesso", message: "Cálculo realizado com sucesso!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
}
