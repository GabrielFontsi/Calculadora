//
//  CalculatorHistoryViewController.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

class CalculatorHistoryViewController: UIViewController {
    
    private var calculatorHistoryScreen = CalculatorHistoryScreen()
    private var calculation: [Calculation] = []
        
        init(counts: [Calculation]) {
            self.calculation = counts
            super.init(nibName: nil, bundle: nil)
        }
    
    override func loadView() {
        self.view = self.calculatorHistoryScreen
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.calculatorHistoryScreen.configTableViewDelegate(delegate: self, dataSource: self)
        self.setupNavigationBar()
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.barTintColor = .systemYellow
        title = "Histórico"
    }

}

extension CalculatorHistoryViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if calculation.isEmpty {
            calculatorHistoryScreen.setEmptyMessage("Nenhum cálculo encontrado")
        }else {
            calculatorHistoryScreen.restoreTableView()
        }
        return calculation.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CalculatorHistoryTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let item = calculation[indexPath.row]
        cell.selectionStyle = .none
        cell.setupCell(count: item)
        return cell
    }
    
}
