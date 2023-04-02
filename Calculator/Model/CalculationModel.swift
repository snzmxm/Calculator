//
//  CalculationModel.swift
//  Calculator
//
//  Created by SNZ on 19.01.2023.
//

import Foundation

class CalculationModel {
    //10 -
    private var firstNumber = 0.0
    private var secondNumber = 0.0
    private var currentNumber = ""
    private var currentOperation = Operations.noAction
    //29 - для записи нашей истории
    private var currentHistory = ""

    //30 - логика лейбла истории
    public func getCalculationHistory(tag: Int) -> String {

        switch tag {
        case 0...9:
            if currentHistory == "0" {
                currentHistory.removeLast()
            }
            currentHistory += "\(tag)"
        case 10:
            //let index = currentHistory.index(before: currentHistory.endIndex)
            if !currentNumber.contains(".") {
                currentHistory += ","
            }
        case 12...15:
            guard let last = currentHistory.last else { break }
            if last == "+" ||
                last == "-" ||
                last == "*" ||
                last == "/" {
                currentHistory.removeLast()
            }
            currentHistory += currentOperation.rawValue
        case 16:
            if currentHistory == "%" {
                currentHistory.removeLast()
            }
            currentHistory += "%"
            //33 - вызываем метод инвертирования из 32 пункта
        case 17:
            setInvertHistoryValue()
        default:
            print("error tag histiry")
            break
        }
        return currentHistory
    }

    //32 - плюс минус для истории лейблов
    private func setInvertHistoryValue() {
        guard let number = Double(currentNumber) else { return }

        switch number {
        case ..<0:
            //берем последний индекс и смещаемся на два влево
            // 6--3 (удаляем -(минус) перед тройкой он и будет второй символ с конца)
            let index = currentHistory.index(currentHistory.endIndex, offsetBy: -2)
            currentHistory.remove(at: index)
        case 0: break
        case 0...:
            let index = currentHistory.index(before: currentHistory.endIndex)
            currentHistory.insert("-", at: index)
        default:
            print("invert value error")
        }
    }

    // 16 - тут мы делаем метод, который при нажатии на кнопки от 0-9 в лейбл выводил значение типо 1234567890645363546...
    public func setNumber(number: Int) {
        // тут говорим, чтобы 0 убирался при нажатии на любое число в самом начале и оставалось второе число ( чтобы не было 02 к примеру)
        if number != 0 && currentNumber == "0" {
            currentNumber.removeFirst()
        }
        // тут говорим, чтобы при нажати на 0 не было 0000000
        if number == 0 && currentNumber == "0" {
            currentNumber.removeLast()
        }

        currentNumber.append(String(number))
    }

    //17 - возвращаем для вью контроллера значение, которое получилось
    public func getСurrentNumber() -> String {
        currentNumber.stringWithPoint
    }

    // 21 - присваевыем значению операцию по сложени,умножению и т.д
    public func setOperation(operation: Operations) -> String {

        if currentOperation == .noAction {
            guard let number = Double(currentNumber) else { return "0" }
            firstNumber = number
        } else {
            //тут мы получаем промежуточный результат например 15 - 5 +(показывается 10) 20 = 30
            guard let result = Double(getResult()) else {
                //чтобы при нажатии на операцию в истории менялось значение
                currentOperation = operation
                return firstNumber.stringWithoutZeroFraction.stringWithPoint
            }
            firstNumber = result
        }
        currentNumber = ""
        currentOperation = operation
        return firstNumber.stringWithoutZeroFraction.stringWithPoint
    }

    //22 - при нажатии на равенство получаем результат
    public func getResult() -> String {

        guard let number = Double(currentNumber) else { return "" }
        secondNumber = number

        var result = 0.0

        switch currentOperation {
        case .noAction:
            return currentNumber
        case .addition:
            result = firstNumber + secondNumber
        case .substraction:
            result = firstNumber - secondNumber
        case .multyplication:
            result = firstNumber * secondNumber
        case .division:
            if secondNumber == 0 {
                return "Не определено"
            } else {
                result = firstNumber / secondNumber
            }
        }
        return result.stringWithoutZeroFraction.stringWithPoint
    }

    //24 - скидываем наши значения при нажатии на АС
    public func resetValues() {
        firstNumber = 0.0
        secondNumber = 0.0
        currentNumber = ""
        currentOperation = .noAction
        currentHistory = ""
    }

    //25 - инвертирование числа с +/-
    public func invertValue() {
        guard let number = Double(currentNumber) else {
            currentNumber = "0"
            return
        }

        switch number {
        case ..<0:
            currentNumber.remove(at: currentNumber.startIndex)
        case 0: break
        case 0...:
            currentNumber.insert("-", at: currentNumber.startIndex)
        default:
            print("error invert value")
        }
    }

    // 26 - добавление дробной части через точку(запятую)
    public func addPointValue() {

        //если число не содержит точку
        if !currentNumber.contains(".") {
            currentNumber += currentNumber != "" ? "." : "0."
        }
    }

    //27 - операции с процентами
    public func setPersentNumber() {
        guard let number = Double(currentNumber) else { return }

        if  firstNumber == 0 {
            currentNumber = "\(number / 100)"
        } else {
            currentNumber = "\(firstNumber * number / 100)"
        }
    }
}
