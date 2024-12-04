//
//  Double + Extension.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 04/12/24.
//

import Foundation

func formatNumber(_ number: Double) -> String {
    let formatter = NumberFormatter()
    formatter.numberStyle = .decimal
    formatter.minimumFractionDigits = 0
    formatter.maximumFractionDigits = 2
    return formatter.string(from: NSNumber(value: number)) ?? "\(number)"
}
