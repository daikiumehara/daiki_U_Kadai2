//
//  ViewController.swift
//  Kadai2
//
//  Created by daiki umehara on 2021/05/22.
//

import UIKit

final class ViewController: UIViewController {
    enum Calculation {
        case addition
        case subtraction
        case multiplication
        case division

        init?(selectedSegmentIndex: Int) {
            switch selectedSegmentIndex {
            case 0:
                self = .addition
            case 1:
                self = .subtraction
            case 2:
                self = .multiplication
            case 3:
                self = .division
            default:
                return nil
            }
        }
    }

    @IBOutlet private var firstTextField: UITextField!
    @IBOutlet private var secondTextField: UITextField!
    @IBOutlet private var operatorSegmented: UISegmentedControl!
    @IBOutlet private var calcButton: UIButton!
    @IBOutlet private var answerLabel: UILabel!

    private func getCalcResultString(_ firstValue: Double, _ secondValue: Double) -> String {
        guard let calculation = Calculation(selectedSegmentIndex: operatorSegmented.selectedSegmentIndex) else {
            return "演算子が正しく入力されていません"
        }

        switch calculation {
        case .addition:
            return String(firstValue + secondValue)
        case .subtraction:
            return String(firstValue - secondValue)
        case .multiplication:
            return String(firstValue * secondValue)
        case .division:
            if secondValue == 0.0 {
                return "割る数には0以外を入力してください"
            } else {
                return String(firstValue / secondValue)
            }
        }
    }

    @IBAction private func calcButtonDidTapped(_ sender: Any) {
        func stringToDouble(_ text: String?) -> Double? {
            guard let text = text else { return nil }
            guard let value = Double(text) else { return nil }
            return value
        }

        guard let firstValue = stringToDouble(firstTextField.text),
              let secondValue = stringToDouble(secondTextField.text) else {
            answerLabel.text = "値を入力してください"
            return
        }
        answerLabel.text = getCalcResultString(firstValue, secondValue)
    }
}
