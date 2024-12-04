//
//  CalculatorHistoryScreen.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

class CalculatorHistoryScreen: UIView {
    
    lazy var tableView: UITableView = {
        let tb = UITableView()
        tb.translatesAutoresizingMaskIntoConstraints = false
        tb.register(type:CalculatorHistoryTableViewCell.self)
        tb.separatorStyle = .none
        tb.backgroundColor = .clear
        return tb
    }()
    
    public func configTableViewDelegate(delegate: UITableViewDelegate, dataSource: UITableViewDataSource){
        self.tableView.delegate = delegate
        self.tableView.dataSource = dataSource
    }
    
    func setEmptyMessage(_ message: String) {
        let lb = UILabel()
        lb.text = message
        lb.textAlignment = .center
        lb.font = UIFont.systemFont(ofSize: 28)
        lb.textColor = .white
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundView = lb
        
        NSLayoutConstraint.activate([
            lb.centerXAnchor.constraint(equalTo: tableView.centerXAnchor),
            lb.centerYAnchor.constraint(equalTo: tableView.centerYAnchor),
            lb.leadingAnchor.constraint(greaterThanOrEqualTo: tableView.leadingAnchor, constant: 20),
            lb.trailingAnchor.constraint(lessThanOrEqualTo: tableView.trailingAnchor, constant: -20)
        ])
    }
    
    func restoreTableView() {
        tableView.backgroundView = nil
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
        self.addSubview(self.tableView)
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
        ])
    }
    
}
