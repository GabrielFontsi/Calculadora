//
//  Button.swift
//  Calculadora
//
//  Created by Gabriel Fontenele da Silva on 03/12/24.
//

import UIKit

extension UIButton {
    static func createButton(
        imageSystemName: String,
        backgroundColor: UIColor? = nil,
        cornerRadius: CGFloat = 0,
        width: CGFloat? = nil,
        height: CGFloat? = nil,
        target: Any?,
        action: Selector
    ) -> UIButton {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        
        button.setImage(UIImage(systemName: imageSystemName), for: .normal)
        button.tintColor = .white
        
        if let bgColor = backgroundColor {
            button.backgroundColor = bgColor
        }
        
        button.layer.cornerRadius = cornerRadius
        button.clipsToBounds = true
    
        button.addTarget(target, action: action, for: .touchUpInside)
        
        if let width = width {
            button.widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if let height = height {
            button.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        return button
    }
}
