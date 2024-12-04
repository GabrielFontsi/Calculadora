//
//  Date + Extension.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import Foundation

extension Date {
    func formatToString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
        return formatter.string(from: self)
    }
}
