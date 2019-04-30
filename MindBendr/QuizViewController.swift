//
//  QuizViewController.swift
//  MindBendr
//
//  Created by Julia Klimeck on 4/22/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit
import AVFoundation


class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var currentQuestionCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create audio player and assing to instance variable
        if let timoBreathe = self.setUpAudioPlayerWithFile("breatheWithTimo","mp3"){
            self.breathingWithTimo = timoBreathe
        }
            
        questionLabel()
        
        setupGame()
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //
    // button is pressed for breathing soundtrack
    //
    
    
    
    
    
    // just breathe!
    var breathingWithTimo: AVAudioPlayer?
    
    
    // quiz button is pressed
    
    //
    // variables
    //
    
    var currentQuestion = 1
    var totalQuestions = 10
    var userCorrect = 0
    
    // timer variables
    @IBOutlet weak var timerLabel: UILabel!
    var seconds = 0
    var timer = Timer()
    var timerText = "Time: "
    
    // score variables
    var score = 0
    var currentScore = 0
    
    // question variables
    var changeQuestion = false
    
    // quiz label (top of screen) is pulls text matching name of the button pressed
    
    // output to currentQuestionLabel the currentQuestion of totalQuestions
    func questionLabel () {
        
    currentQuestionCounter.text = "\(currentQuestion) of \(totalQuestions)"
    
    }
    

    // display first question and answer options
    
    // foreach (currentQuestion < totalQuestion) { user selects answer
    
    // check if answer is true {
    
    // change answer button to green
    
    // increment userCorrect by 1
    
    // } else confirm quesiton is wrong {
    
    // change answer button to red
    
    // } end if else
    
    // timer count down to change question
    
    // increment currentQuestion by 1
    
    // } end foreach
    
    // Reset Timer Function
    
    // Change Question Function
    
    
    func setupGame() {
        // timer count down to change question
        // change seconds to start at 30
        seconds = 30
        
        // change timerLabel to match current time
        timerLabel.text = "\(timerText) \(seconds)"
        
        // timer function to track time
        timer = Timer.scheduledTimer(timeInterval: 1.0,
                                     target: self,
                                     selector: #selector(QuizViewController.subtractTime),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    func runGame() {
        
    }
    
    // subtractTime func, actually subtracts time from 30 seconds to 0
    @objc func subtractTime() {
        // subtract 1 second every 1 second interval till 0
        seconds -= 1 //seconds = seconds - 1
        
        // redisplay timer
        timerLabel.text = "\(timerText) \(seconds)"
        
        
        // if seconds hits 0, reset to 30 seconds and change question
        if seconds == 0 {
            // MAIN STUFF DONE IN TIME LOOP
            changeQuestion = true
            
            timer.invalidate()
        }
    }
    
    
    
    
    
    // breathing with Timo
    func setUpAudioPlayerWithFile(_ file: String, _ type: String) -> AVAudioPlayer? {
        // Use Bundle class to tell Xcode where in the project to look
        // for the passed-in file. It will give us the full (absolute)
        // pasth to file.
        
        let path = Bundle.main.path(forResource: file, ofType: type)
        
        // AVAudioPlayer needs the path in the form of a URL, so
        // we need to conver the full path we just got in path
        // to URL format
        let url = URL(fileURLWithPath: path!)
        
        // Decalare an AVAudioPlayer variable as an optional in case
        // there is a condition when an AVAudioPlayer object cannot
        // be created which could be dependent on the device that
        // is trying nnto instantiate it.
        var audioPlayer: AVAudioPlayer?
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: url)
        } catch {
            // can do as an alert
            print("Player Not Available")
        }
        
        return audioPlayer
    }
    
    
}
