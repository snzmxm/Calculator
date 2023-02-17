//
//  ViewController.swift
//  Calculator
//
//  Created by SNZ on 18.01.2023.
//

import UIKit

class ViewController: UIViewController {

    // 7 - создали мы МайнСтэкВью теперь его нам нужно тут расположить
    private let mainStackView = MainStackViewTwo()

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

//    private lazy var  closeButton: UIButton = {
//        let button = UIButton(type: .system)
//        button.setBackgroundImage(UIImage(named: "sum"), for: .normal)
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.addTarget(self, action: #selector(closeButtonTapped), for: .touchUpInside)
//        return button
//    }()
//
//    @objc private func closeButtonTapped() {
//
//    }

//    private lazy var parentStackView: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 30
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private lazy var buttonsStackNew: UIStackView = {
//        let stackView = UIStackView()
//        stackView.axis = .vertical
//        stackView.spacing = 1
//        stackView.distribution = .fillProportionally
////        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }()
//
//    private func createHorizontalStackView() -> UIStackView {
//        let stackView = UIStackView()
//        stackView.axis = .horizontal
//        stackView.spacing = -25
//        stackView.distribution = .fillProportionally
////        stackView.translatesAutoresizingMaskIntoConstraints = false
//        return stackView
//    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setConstraints()
        //14 - подписываем делегата
        mainStackView.delegate = self
    }



    private func setupViews() {

//        view.backgroundColor = .gray
        view.addSubview(imageBack)
        view.addSubview(mainStackView)
        view.addSubview(resultLabel)
        view.addSubview(historyLabel)

//        view.addSubview(parentStackView)
//        parentStackView.addArrangedSubview(resultLabel)
//        parentStackView.addArrangedSubview(buttonsStackNew)
//
//        buttonsStackNew.addArrangedSubview(firstStackView)
//        firstStackView.addArrangedSubview(delete)
//        firstStackView.addArrangedSubview(plusMinus)
//        firstStackView.addArrangedSubview(persent)
//        firstStackView.addArrangedSubview(division)
//
//        buttonsStackNew.addArrangedSubview(secondStackView)
//        secondStackView.addArrangedSubview(numb7)
//        secondStackView.addArrangedSubview(numb8)
//        secondStackView.addArrangedSubview(numb9)
//        secondStackView.addArrangedSubview(multy)
//
//        buttonsStackNew.addArrangedSubview(thirdStackView)
//        thirdStackView.addArrangedSubview(numb4)
//        thirdStackView.addArrangedSubview(numb5)
//        thirdStackView.addArrangedSubview(numb6)
//        thirdStackView.addArrangedSubview(munus)
//
//        buttonsStackNew.addArrangedSubview(fourStackView)
//        fourStackView.addArrangedSubview(numb1)
//        fourStackView.addArrangedSubview(numb2)
//        fourStackView.addArrangedSubview(numb3)
//        fourStackView.addArrangedSubview(plus)
//
//        buttonsStackNew.addArrangedSubview(fiveStackView)
//        fiveStackView.addArrangedSubview(numb0)
//        fiveStackView.addArrangedSubview(dote)
//        fiveStackView.addArrangedSubview(sum)


    }

//    private lazy var delete = UIButton(image: "delete")
//    private lazy var plusMinus = UIButton(image: "plusMinus")
//    private lazy var persent = UIButton(image: "percent")
//    private lazy var division = UIButton(image: "division")
//    private lazy var firstStackView = createHorizontalStackView()
//
//    private lazy var numb7 = UIButton(image: "numb 7")
//    private lazy var numb8 = UIButton(image: "numb 8")
//    private lazy var numb9 = UIButton(image: "numb 9")
//    private lazy var multy = UIButton(image: "multiplication")
//    private lazy var secondStackView = createHorizontalStackView()
//
//    private lazy var numb4 = UIButton(image: "numb 4")
//    private lazy var numb5 = UIButton(image: "numb 5")
//    private lazy var numb6 = UIButton(image: "numb 6")
//    private lazy var munus = UIButton(image: "subtraction")
//    private lazy var thirdStackView = createHorizontalStackView()
//
//    private lazy var numb1 = UIButton(image: "numb 1")
//    private lazy var numb2 = UIButton(image: "numb 2")
//    private lazy var numb3 = UIButton(image: "numb 3")
//    private lazy var plus = UIButton(image: "addition")
//    private lazy var fourStackView = createHorizontalStackView()
//
//    private lazy var numb0 = UIButton(image: "numb 0")
//    private lazy var dote = UIButton(image: "dote")
//    private lazy var sum = UIButton(image: "sum")
//    private lazy var fiveStackView = createHorizontalStackView()

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
//            mainStackView.heightAnchor.constraint(equalToConstant: 450),
//            mainStackView.widthAnchor.constraint(equalToConstant: 100)
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
//
//        NSLayoutConstraint.activate([
//            parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
//            parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0),
//            parentStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
//
//            firstStackView.heightAnchor.constraint(equalToConstant: 110),
//            firstStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
//
//        ])
//
//        NSLayoutConstraint.activate([
//            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: -25),
//            secondStackView.heightAnchor.constraint(equalToConstant: 110)
//        ])
//
//        NSLayoutConstraint.activate([
//            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: -25),
//            thirdStackView.heightAnchor.constraint(equalToConstant: 110)
//        ])
//
//        NSLayoutConstraint.activate([
//            fourStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: -25),
//            fourStackView.heightAnchor.constraint(equalToConstant: 110)
//        ])
//
//        NSLayoutConstraint.activate([
//            fiveStackView.topAnchor.constraint(equalTo: fourStackView.bottomAnchor, constant: -25),
//            fiveStackView.heightAnchor.constraint(equalToConstant: 110),
//        ])
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
