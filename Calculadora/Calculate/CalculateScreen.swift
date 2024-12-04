//
//  CalculateScreen.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

protocol CalculateScreenProtocol: class {
    func actionAdditionButton()
    func actionSubtractionButton()
    func actionMultiplicationButton()
    func actionDivisionButton()
    func actionEqualButton()
}

class CalculateScreen: UIView {
    
    weak private var delegate: CalculateScreenProtocol?
    var currentOperation: String = ""
    
    func delegate(delegate: CalculateScreenProtocol?){
        self.delegate = delegate
    }
        
    lazy var valueATextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite o valor A"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    lazy var operationTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isUserInteractionEnabled = false
        tf.placeholder = "Operação matematica escolhida"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    lazy var valueBTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.placeholder = "Digite o valor B"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    lazy var resultTextField: UITextField = {
        let tf = UITextField()
        tf.translatesAutoresizingMaskIntoConstraints = false
        tf.isUserInteractionEnabled = false
        tf.placeholder = "Resultado da última operação"
        tf.borderStyle = .roundedRect
        tf.keyboardType = .decimalPad
        return tf
    }()
    
    lazy var operationsButtonStackView: UIStackView = {
        let sv = UIStackView(arrangedSubviews: [additionButton, subtractionButton, multiplicationButton, divisionButton, equalButton])
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .horizontal
        sv.distribution = .fillEqually
        sv.spacing = 10
        return sv
    }()
    
    lazy var additionButton: UIButton = {
        UIButton.createButton(imageSystemName:"plus",backgroundColor: .systemGray, cornerRadius: 5, width: 10, height: 10, target: self, action: #selector(self.tappedAdditionButton))
    }()
    
    lazy var subtractionButton: UIButton = {
        UIButton.createButton(imageSystemName:"minus",backgroundColor: .systemGray2, cornerRadius: 5, width: 10, height: 10, target: self, action: #selector(self.tappedSubtractionButton))
    }()
     
    lazy var multiplicationButton: UIButton = {
        UIButton.createButton(imageSystemName:"multiply",backgroundColor: .systemGray3, cornerRadius: 5, width: 10, height: 10, target: self, action: #selector(self.tappedMultiplicationButton))
   
    }()
    
    lazy var divisionButton: UIButton = {
        UIButton.createButton(imageSystemName:"divide", backgroundColor: .systemGray4, cornerRadius: 5, width: 10, height: 10, target: self, action: #selector(self.tappedDivisionButton))

    }()
    
    lazy var equalButton: UIButton = {
        UIButton.createButton(imageSystemName:"equal", backgroundColor: .systemGray5, cornerRadius: 5, width: 10, height: 10, target: self, action: #selector(self.tappedEqualButton))

    }()
    
    @objc private func tappedAdditionButton(){
        self.delegate?.actionAdditionButton()
    }
    
    @objc private func tappedSubtractionButton(){
        self.delegate?.actionSubtractionButton()
    }
    
    @objc private func tappedMultiplicationButton(){
        self.delegate?.actionMultiplicationButton()
    }
    
    @objc private func tappedDivisionButton(){
        self.delegate?.actionDivisionButton()
    }
    
    @objc private func tappedEqualButton(){
        self.delegate?.actionEqualButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupBackground()
        self.addSubView()
        self.setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupBackground(){
        self.backgroundColor = UIColor.systemYellow
    }
    
    private func addSubView(){
        self.addSubview(self.valueATextField)
        self.addSubview(self.operationTextField)
        self.addSubview(self.valueBTextField)
        self.addSubview(self.resultTextField)
        self.addSubview(self.operationsButtonStackView)
    }
    
    public func configTextFieldDelegate(delegate: UITextFieldDelegate){
        self.valueATextField.delegate = delegate
        self.valueBTextField.delegate = delegate
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            valueATextField.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            valueATextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            valueATextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            operationTextField.topAnchor.constraint(equalTo: valueATextField.bottomAnchor, constant: 10),
            operationTextField.leadingAnchor.constraint(equalTo: valueATextField.leadingAnchor),
            operationTextField.trailingAnchor.constraint(equalTo: valueATextField.trailingAnchor),
            
            valueBTextField.topAnchor.constraint(equalTo: operationTextField.bottomAnchor, constant: 10),
            valueBTextField.leadingAnchor.constraint(equalTo: operationTextField.leadingAnchor),
            valueBTextField.trailingAnchor.constraint(equalTo: operationTextField.trailingAnchor),
            
            resultTextField.topAnchor.constraint(equalTo: valueBTextField.bottomAnchor, constant: 10),
            resultTextField.leadingAnchor.constraint(equalTo: valueBTextField.leadingAnchor),
            resultTextField.trailingAnchor.constraint(equalTo: valueBTextField.trailingAnchor),
            
            operationsButtonStackView.topAnchor.constraint(equalTo: resultTextField.bottomAnchor, constant: 20),
            operationsButtonStackView.leadingAnchor.constraint(equalTo: resultTextField.leadingAnchor),
            operationsButtonStackView.trailingAnchor.constraint(equalTo: resultTextField.trailingAnchor),
            operationsButtonStackView.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
