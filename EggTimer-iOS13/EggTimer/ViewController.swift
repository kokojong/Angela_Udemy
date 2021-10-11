//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
//    let softTime = 5
//    let mediemTime = 7
//    let hardTime = 12
    
    let eggTimes = ["Soft":5, "Medium":7, "Hard":12]
    
    var totalTime = 0
    var secondPassed = 0
    var seconds = 60
    var timer = Timer()
    
    var player : AVAudioPlayer!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBAction func hardnessSelected(_ sender: UIButton) {
        
        let hardness = sender.currentTitle!
        
        timer.invalidate() // 기존의 타이머를 초기화
        
//        print(eggTimes[hardness]!)
//
        totalTime = eggTimes[hardness]! * 60
        
        progressBar.progress = 0
        secondPassed = 0
        titleLabel.text = hardness
        
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer (){
        if secondPassed < totalTime {
            secondPassed += 1
            print("\(totalTime - secondPassed) sec")
            
            progressBar.progress = Float(secondPassed) / Float(totalTime)
            
     
        } else {
            
            timer.invalidate()
            titleLabel.text = "DONE!"
            playSound()
        }
        
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
        // print()
                
    }
}
