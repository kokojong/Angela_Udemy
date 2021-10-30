//
//  ResultViewController.swift
//  BMI Calculator
//
//  Created by kokojong on 2021/10/29.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var bmiLabel: UILabel!
    @IBOutlet weak var advanceLabel: UILabel!
    
    var bmiValue: String?
    var advice: String?
    var color: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        bmiLabel.text = bmiValue
        advanceLabel.text = advice
        view.backgroundColor = color
    }
    
    @IBAction func recalculateButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }

}
