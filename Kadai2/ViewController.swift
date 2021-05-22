//
//  ViewController.swift
//  Kadai2
//
//  Created by daiki umehara on 2021/05/22.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private var firstTextField: UITextField!
    @IBOutlet private var secondTextField: UITextField!
    @IBOutlet private var operatorSegmented: UISegmentedControl!
    @IBOutlet private var calcButton: UIButton!
    @IBOutlet private var answerLabel: UILabel!
    private func stringToDouble(_ text: String?) -> Double? {
        guard let text = text else { return nil }
        guard let value = Double(text) else { return nil }
        return value
    }
    private func getCalcResultString(_ firstValue: Double, _ secondValue: Double) -> String {
        switch operatorSegmented.selectedSegmentIndex {
        case 0:
            return String(firstValue + secondValue)
        case 1:
            return String(firstValue - secondValue)
        case 2:
            return String(firstValue * secondValue)
        case 3:
            if secondValue == 0.0 {
                return "割る数には0以外を入力してください"
            }
            return String(firstValue / secondValue)
        default:
            return "演算子が正しく入力されていません"
        }
    }
    @IBAction private func calcButtonDidTapped(_ sender: Any) {
        guard let firstValue = stringToDouble(firstTextField.text),
              let secondValue = stringToDouble(secondTextField.text) else {
            answerLabel.text = "値を入力してください"
            return
        }
        answerLabel.text = getCalcResultString(firstValue, secondValue)
    }
}
