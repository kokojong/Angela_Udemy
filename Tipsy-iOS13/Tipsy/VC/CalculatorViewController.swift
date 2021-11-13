//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitLabel: UILabel!
    
    var billNumber: Double = 0.0
    
    var splitNumber = 2
    
    var tipPercent = 0

    @IBAction func tipChanged(_ sender: UIButton) {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
        splitNumber = Int(sender.value)
        splitLabel.text = "\(splitNumber)"
        
        billTextField.endEditing(true)
    }
    
    @IBAction func onCalculateButtonClicked(_ sender: UIButton) {
        
       
        print(splitNumber)
        
        let billText = billTextField.text
        
        billNumber = Double(billText!) ?? 0.0
        
        if zeroPctButton.isSelected {
            print(0.0)
            tipPercent = 0
        } else if tenPctButton.isSelected {
            billNumber *= 1.1
            tipPercent = 10
            print(0.1)
        } else if twentyPctButton.isSelected {
            billNumber *= 1.2
            tipPercent = 20
            print(0.2)
        }
        
        print(billNumber)
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc = sb.instantiateViewController(withIdentifier: ResultViewController.identifier) as! ResultViewController
        
        vc.bill = billNumber
        vc.person = splitNumber
        vc.tipPercent = tipPercent
        
        present(vc, animated: true, completion: nil)
        
    }
}

