//
//  MainStackView.swift
//  Calculator
//
//  Created by SNZ on 17.02.2023.
//

import UIKit

// 11 - создаем протокол
protocol MainStackViewProtocol: AnyObject {
    //тап по кнопкап 0-9
    func tapNumberButton(tag: Int)
    //тап по остальныи кнопкам
    func tapActionButton(tag: Int)
}

class MainStackView: UIStackView {

    // 3 - создали массив стэк вию
    private var arrayStackView = [UIStackView]()

    // 12 - создаем делегата через которого будет работтать протокол weak - чтобы не было утечки памяти
    weak var delegate: MainStackViewProtocol?

    private lazy var parentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()

    private lazy var buttonsStackNew: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 1
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private func createHorizontalStackView() -> UIStackView {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = -25
        stackView.distribution = .fillProportionally
        return stackView
    }

    private func configure() {
        axis = .vertical
        spacing = -10
        distribution = .fillEqually
        translatesAutoresizingMaskIntoConstraints = false
    }

    func createButton(image: String, tag: Int) -> UIButton  {
        let button = UIButton()
        button.tag = tag
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: image), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(tapButtonTarget), for: .touchUpInside)
        return button
    }

    @objc func tapButtonTarget(sender: UIButton) {
        //13 - тернарником проверяем, какой тап отрабатывает. Если от 0 - 9 то tapNumberButton иначе tapActionButton
        sender.tag < 10 ? delegate?.tapNumberButton(tag: sender.tag) : delegate?.tapActionButton(tag: sender.tag)
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        setupViews()
        setConstraints()
        configure()
        arrayStackView.forEach { addArrangedSubview($0) }
    }

    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupViews() {

       addSubview(parentStackView)

        parentStackView.addArrangedSubview(buttonsStackNew)

        buttonsStackNew.addArrangedSubview(firstStackView)
        firstStackView.addArrangedSubview(buttonAC)
        firstStackView.addArrangedSubview(buttonPlusMinus)
        firstStackView.addArrangedSubview(buttonPerthent)
        firstStackView.addArrangedSubview(buttoDivision)

        buttonsStackNew.addArrangedSubview(secondStackView)
        secondStackView.addArrangedSubview(button7)
        secondStackView.addArrangedSubview(button8)
        secondStackView.addArrangedSubview(button9)
        secondStackView.addArrangedSubview(buttonMult)

        buttonsStackNew.addArrangedSubview(thirdStackView)
        thirdStackView.addArrangedSubview(button4)
        thirdStackView.addArrangedSubview(button5)
        thirdStackView.addArrangedSubview(button6)
        thirdStackView.addArrangedSubview(buttonSub)

        buttonsStackNew.addArrangedSubview(fourStackView)
        fourStackView.addArrangedSubview(button1)
        fourStackView.addArrangedSubview(button2)
        fourStackView.addArrangedSubview(button3)
        fourStackView.addArrangedSubview(buttonSum)

        buttonsStackNew.addArrangedSubview(fiveStackView)
        fiveStackView.addArrangedSubview(button0)
        fiveStackView.addArrangedSubview(buttonPoint)
        fiveStackView.addArrangedSubview(buttonEqually)
    }

    private lazy var button0 = createButton(image: "numb 0", tag: 0)
    private lazy var buttonPoint = createButton(image: "dote", tag: 10)
    private lazy var buttonEqually = createButton(image: "sum", tag: 11)
    private lazy var fiveStackView = createHorizontalStackView()

    private lazy var button1 = createButton(image: "numb 1", tag: 1)
    private lazy var button2 = createButton(image: "numb 2", tag: 2)
    private lazy var button3 = createButton(image: "numb 3", tag: 3)
    private lazy var buttonSum = createButton(image: "addition", tag: 12)
    private lazy var fourStackView = createHorizontalStackView()

    private lazy var button4 = createButton(image: "numb 4", tag: 4)
    private lazy var button5 = createButton(image: "numb 5", tag: 5)
    private lazy var button6 = createButton(image: "numb 6", tag: 6)
    private lazy var buttonSub = createButton(image: "subtraction", tag: 13)
    private lazy var thirdStackView = createHorizontalStackView()

    private lazy var button7 = createButton(image: "numb 7", tag: 7)
    private lazy var button8 = createButton(image: "numb 8", tag: 8)
    private lazy var button9 = createButton(image: "numb 9", tag: 9)
    private lazy var buttonMult = createButton(image: "multiplication", tag: 14)
    private lazy var secondStackView = createHorizontalStackView()

    private lazy var buttonAC = createButton(image: "delete", tag: 18)
    private lazy var buttonPlusMinus = createButton(image: "plusMinus", tag: 17)
    private lazy var buttonPerthent = createButton(image: "percent", tag: 16)
    private lazy var buttoDivision = createButton(image: "division", tag: 15)
    private lazy var firstStackView = createHorizontalStackView()

}

extension MainStackView {
    private func setConstraints() {


        NSLayoutConstraint.activate([
            parentStackView.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 0),
            parentStackView.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: 0),
            parentStackView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),

            firstStackView.heightAnchor.constraint(equalToConstant: 110),
            firstStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),

        ])

        NSLayoutConstraint.activate([
            secondStackView.topAnchor.constraint(equalTo: firstStackView.bottomAnchor, constant: -25),
            secondStackView.heightAnchor.constraint(equalToConstant: 110)
        ])

        NSLayoutConstraint.activate([
            thirdStackView.topAnchor.constraint(equalTo: secondStackView.bottomAnchor, constant: -25),
            thirdStackView.heightAnchor.constraint(equalToConstant: 110)
        ])

        NSLayoutConstraint.activate([
            fourStackView.topAnchor.constraint(equalTo: thirdStackView.bottomAnchor, constant: -25),
            fourStackView.heightAnchor.constraint(equalToConstant: 110)
        ])

        NSLayoutConstraint.activate([
            fiveStackView.topAnchor.constraint(equalTo: fourStackView.bottomAnchor, constant: -25),
            fiveStackView.heightAnchor.constraint(equalToConstant: 110),
        ])
    }
}



