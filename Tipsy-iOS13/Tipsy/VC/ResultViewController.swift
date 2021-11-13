//
//  ResultViewController.swift
//  Tipsy
//
//  Created by kokojong on 2021/11/06.
//  Copyright © 2021 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {
    
    static let identifier = "ResultViewController"
    
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var settingLabel: UILabel!
    
    var bill: Double = 0.0
    
    var tipPercent: Int = 0
    
    var person: Int = 0
    
    var totalPerPerson: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        totalPerPerson = bill / Double(person)
        
        let totalPerPersonString = String(format: "%.2f", totalPerPerson)
        totalLabel.text = totalPerPersonString
        
        settingLabel.text = "Split between \(person) people, with \(tipPercent)% tip."

      
    }
    
    @IBAction func onRecalculateButtonClicked(_ sender: UIButton) {
        
        dismiss(animated: true, completion: nil)
        
    }
    
    
}
