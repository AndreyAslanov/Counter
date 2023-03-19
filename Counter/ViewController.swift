//
//  ViewController.swift
//  Counter
//
//  Created by Андрей Асланов on 18.03.23.
//

import UIKit

var count = 0
var history = "История изменений:"

class ViewController: UIViewController {
    
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    @IBOutlet weak var changeMinusButton: UIButton!
    @IBOutlet weak var changeButton: UIButton!
    @IBOutlet weak var counterLabelView: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        counterLabelView.text = "Значение счетчика: \(count)"
        historyTextView.text = history
        
    }
    
    func getCurrentDataTime() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd.MM.yyyy HH:mm:ss"
        let date = Date()
        let dateString = dateFormatter.string(from: date)
        return dateString
    }
    
    @IBAction func plusCountButton(_ sender: Any) {
        count += 1
        if count >= 0 {
            counterLabelView.text = "Значение счетчика: \(count)"
            let currentDate = getCurrentDataTime()
            history += "\(currentDate): значение изменено на +1\n"
            historyTextView.text = history
        }else{
            count = 0
        }
    }
    
    @IBAction func minusCountButton(_ sender: Any) {
        count -= 1
        let currentDate = getCurrentDataTime()
        if count >= 0 {
            counterLabelView.text = "Значение счетчика: \(count)"
            history += "\(currentDate): значение изменено на -1\n"
            historyTextView.text = history
        }else{
            count = 0
            history += "\(currentDate): попытка уменьшить значение счётчика ниже 0\n"
            historyTextView.text = history
        }
    }
    
    @IBAction func resetButtonPressed(_ sender: Any) {
        count = 0
        counterLabelView.text = "Значение счетчика: \(count)"
        let currentDate = getCurrentDataTime()
        history += "\(currentDate): значение сброшено\n"
        historyTextView.text = history
        
    }
    
}
