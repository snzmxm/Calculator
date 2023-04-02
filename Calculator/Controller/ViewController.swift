//
//  ViewController.swift
//  Calculator
//
//  Created by SNZ on 18.01.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // 7 - создали мы МайнСтэкВью теперь его нам нужно тут расположить
    private let mainStackView = MainStackView()
    
    //18 - экземляр нашей модели
    private let calculationModel = CalculationModel()
    
    private let resultLabel: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.font = .systemFont(ofSize: 60)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let historyLabel: UILabel = {
        let label = UILabel()
        label.text = ""
        label.textColor = .gray
        label.font = .systemFont(ofSize: 30)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.3
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        //14 - подписываем делегата
        mainStackView.delegate = self
    }
    
    
    
    private func setupViews() {
        
        view.addSubview(imageBack)
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
        view.addSubview(historyLabel)
    }
    
    private func addImage(width named: String) -> UIImageView {
        let imageView = UIImageView()
        imageView.image = UIImage(named: named)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }
    
    private lazy var imageBack = addImage(width: "background")
}

extension ViewController {
    private func setConstraints() {
        
        NSLayoutConstraint.activate([
            imageBack.topAnchor.constraint(equalTo: view.topAnchor),
            imageBack.leadingAnchor.constraint(equalTo: view.leadingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
            mainStackView.heightAnchor.constraint(equalTo: mainStackView.widthAnchor, multiplier: 1.15)
        ])
        
        NSLayoutConstraint.activate([
            historyLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -10),
            historyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            historyLabel .trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            resultLabel.bottomAnchor.constraint(equalTo: historyLabel.topAnchor, constant: -10),
            resultLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            resultLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}


extension ViewController: MainStackViewProtocol {
    
    func tapNumberButton(tag: Int) {
        //19  - устанавливаем значение по тапу от 0-9
        calculationModel.setNumber(number: tag)
        //20 - присваевываем значение
        resultLabel.text = calculationModel.getСurrentNumber()
        //31 - присваевыем тапы к истории и добавляем к tapActionButton
        historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
    }
    
    func tapActionButton(tag: Int) {
        // 23 - перебираем свитчом теги (22 - 27 в calculationModel)
        switch tag {
        case 10: // .
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
            calculationModel.addPointValue()
            resultLabel.text = calculationModel.getСurrentNumber()
        case 11: // =
            resultLabel.text = calculationModel.getResult()
        case 12: // +
            resultLabel.text = calculationModel.setOperation(operation: .addition)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 13: // -
            resultLabel.text = calculationModel.setOperation(operation: .substraction)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 14: // *
            resultLabel.text = calculationModel.setOperation(operation: .multyplication)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 15: // /
            resultLabel.text = calculationModel.setOperation(operation: .division)
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 16: // %
            calculationModel.setPersentNumber()
            resultLabel.text = calculationModel.getСurrentNumber()
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
        case 17: // +/-
            historyLabel.text = calculationModel.getCalculationHistory(tag: tag)
            calculationModel.invertValue()
            resultLabel.text = calculationModel.getСurrentNumber()
        case 18: // AC
            calculationModel.resetValues()
            resultLabel.text = "0"
            historyLabel.text = ""
        default:
            print("error tag")
        }
    }
}
