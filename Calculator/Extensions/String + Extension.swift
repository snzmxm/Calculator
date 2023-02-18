//
//  String + Extension.swift
//  Calculator
//
//  Created by SNZ on 17.02.2023.
//

import Foundation
// будем заменять точку на запятую
extension String {
    var stringWithPoint: String {
        //если у нас есть точка в значении мы эту точку заменяем на запятую : если же точки нет возвращаем наше значение
        self.contains(".") ? self.replacingOccurrences(of: ".", with: ",") : self
    }
}
