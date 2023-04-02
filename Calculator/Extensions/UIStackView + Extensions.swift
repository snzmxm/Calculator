//
//  UIStackView + Extensions.swift
//  Calculator
//
//  Created by SNZ on 17.02.2023.
//

import UIKit

extension UIStackView {
    
    convenience init(subviews: [UIView]) {
        self.init(arrangedSubviews: subviews)
        self.axis = .horizontal
        self.spacing = 1
        self.distribution = .fillEqually
    }
}
