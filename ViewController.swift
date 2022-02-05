//
//  ViewController.swift
//  Prework
//
//  Created by Loan Nguyen on 2022-02-01.
//  Copyright © 2022 Loan Nguyen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var totalAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var tipPercentageLabel: UILabel!
    @IBOutlet weak var calculateButton: UIButton!
    @IBOutlet weak var currencyLabel: UILabel!
    
    var billAmount: Double = 0
    var tipPercentage: Double = 0.15
    var tipAmount: Double = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCurrencyLabel()
        
        billAmountTextField.keyboardType = .decimalPad
    }
    
    func setCurrencyLabel() {
        let locale = Locale.current
        if let currencyCode = locale.currencyCode {
            currencyLabel.text = String(format: "%@", currencyCode)
        }
    }
    
    func updateTipAmountLabel() {
        tipAmountLabel.text = String(format: "$%.2f", tipAmount)
    }
    
    @IBAction func billTextFieldChanged(_ sender: Any) {
        billAmount = Double(billAmountTextField.text!) ?? 0
        tipAmount = billAmount * tipPercentage
        updateTipAmountLabel()
    }
    
    @IBAction func sliderChanged(_ sender: Any) {
        let tipDecimal = Int(tipSlider.value)
        tipPercentage = Double(tipDecimal) / 100
        tipAmount = billAmount * tipPercentage
        tipPercentageLabel.text = String(format: "%d%%", tipDecimal)
        
       updateTipAmountLabel()
    }
    
    @IBAction func calculateButtonTapped(_ sender: Any) {
        let totalAmount = billAmount + tipAmount
        totalAmountLabel.text = String(format: "$%.2f", totalAmount)
        
    }
}

