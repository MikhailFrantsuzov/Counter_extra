//
//  ViewController.swift
//  Counter_extra
//
//  Created by Mikhail Frantsuzov on 21.09.2023.
//

import UIKit
class ViewController: UIViewController {
    private var counterValue = 0
    private var changeHistory = "История изменений:"
    private var currentTime = ""
    @IBOutlet weak private var labelText: UITextView!
    @IBOutlet weak private var labelCounter: UILabel!
    @IBOutlet weak private var buttonPlus: UIButton!
    @IBOutlet weak private var buttonMinus: UIButton!
    @IBOutlet weak private var buttonReset: UIButton!
    @IBOutlet weak private var buttonHistoryClear: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        currentTime = dateFormatter.string(from: Date())
    }
    @IBAction private func valuePlus(_ sender: Any) {
        counterValue += 1
        changeHistory.append("\n[\(currentTime)] Значение изменено на +1")
        labelCounter.text = "\(counterValue)"
        labelText.text = "\(changeHistory)"
    }
    @IBAction private func valueMinus(_ sender: Any) {
        counterValue -= 1
        if counterValue >= 0 {
            labelCounter.text = "\(counterValue)"
            changeHistory.append("\n[\(currentTime)] Значение изменено на -1")
            labelText.text = "\(changeHistory)"
        } else {
            changeHistory.append("\n[\(currentTime)] Попытка уменьшить значение счётчика ниже 0")
            labelText.text = "\(changeHistory)"
            return counterValue = 0
        }
    }
    @IBAction private func valueReset(_ sender: Any) {
        counterValue = 0
        labelCounter.text = "\(counterValue)"
        changeHistory.append("\n[\(currentTime)] Значение сброшено")
        labelText.text = "\(changeHistory)"
    }
    @IBAction private func historyClear(_ sender: Any) {
        changeHistory = "История изменений:"
        labelText.text = "\(changeHistory)"
    }
}

