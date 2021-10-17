//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
//    let quiz = [["2 + 4 = 6","True"],
//                ["4-2 = 1", "False"],
//                ["4 + 6 = 10","True"]]
//
//    let quiz = [Question(q: "2 + 4 = 6", a: "True"),
//                Question(q: "4 - 2 = 1", a: "False"),
//                Question(q: "4 + 6 = 10", a: "true")]
    
    var quizBrain = QuizBrain()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        updateUI()
        
    }

    @IBAction func onButtonClicked(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        
        let userGoItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGoItRight {
            sender.backgroundColor = UIColor.green
            
        } else {
            sender.backgroundColor = UIColor.red
            
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)

    
    }
 
    @objc func updateUI() {
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        scoreLabel.text = "Score : \(quizBrain.getScore())"
        
        
        
    }
}

