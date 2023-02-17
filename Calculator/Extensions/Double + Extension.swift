//
//  Double + Extension.swift
//  Calculator
//
//  Created by SNZ on 17.02.2023.
//

import Foundation
// тык 2.0 убираем дробную часть при нажатии на число чтобы было просто 2

extension Double {
    var stringWithoutZeroFraction: String {
        let test = truncatingRemainder(dividingBy: 1)
        print("Остаток от деление \(test)")
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}
