//
//  CalculatorBrain.swift
//  BMI Calculator
//
//  Created by kokojong on 2021/10/29.
//  Copyright © 2021 Angela Yu. All rights reserved.
//

import Foundation
import UIKit

struct CalculatorBrain {
    
    var bmi: BMI?
    
    func getBMIValue() -> String {
       
        let bmiTo1DecimalPlace = String(format: "%.1f", bmi?.value ?? "0.0")
        return bmiTo1DecimalPlace
       
    }
    
    func getAdvice() -> String {
        return bmi?.advice ?? "no advice"
    }
    
    func getColor() -> UIColor {
        return bmi?.color ?? .lightGray
    }
    
    mutating func calculateBMI(height: Float, weight: Float) {
        
        let bmiValue = weight / (height * height)
        
        if bmiValue < 18.5 {
            bmi = BMI(value: bmiValue, advice: "eat more", color: .blue)
        } else if bmiValue < 24.9 {
            bmi = BMI(value: bmiValue, advice: "that's okay", color: .green)
        } else {
            bmi = BMI(value: bmiValue, advice: "eat less", color: .red)
        }
        
        
    }
}
