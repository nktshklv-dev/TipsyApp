//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
    @IBOutlet var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var stepperValue = 2.0
    var total = 0.0
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        deselectButtons()
        sender.isSelected = true
        tip = getTip(button: sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        stepperValue = sender.value
        splitNumberLabel.text = Int(stepperValue).description
    }
    
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        guard let totalBill = Double(billTextField.text!) else {return}
        
        calculateSplittedBill(totalBill: totalBill, tip: tip, people: stepperValue)
        performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ResultsViewController else {return}
        vc.tip = Int(tip * 100)
        vc.people = Int(stepperValue)
        vc.totalPerPerson = total
        
    }
    
    func deselectButtons(){
        let tipButtonsArray = [zeroPctButton, tenPctButton, twentyPctButton]
        tipButtonsArray.forEach { button in
            button?.isSelected = false
        }
    }
    
    
    func getTip(button: UIButton) -> Double{
        let senderText = button.titleLabel!.text!.dropLast()
        let value = Double(senderText)!
        
        tip = value / 100
        return tip
    }
    
    func calculateSplittedBill(totalBill: Double, tip: Double, people: Double){
        let billWithTip = totalBill + (totalBill * tip)
        let splittedBill = billWithTip / people
        let result = round(splittedBill * 100) / 100.0
        total = result
        
    }
    
    
    
    


}

