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
    
    //breathingWithTimo?.play()
    //breathingWithTimo?.volume = 0.6

    // just breathe!
    var breathingWithTimo: AVAudioPlayer?
    
    //
    // quiz button is pressed
    //
    
    
    //
    // variables
    //
    
    var currentQuestion = 1
    var totalQuestions = 10
    var userCorrect = 0
    
    // grab reference to plist chosen and create an array of dictionaries
    // var quizQuestions
    
    // while current question <= totalQuesions
    
    
        // randomize the questions - this can be a function
    
        // take randomized list of quizQuestions grab variable qText to display in questionLabel
    
        // grab the answers array associated with that question - could randomize as well
        // display ansswerOptions on buttons for user to select from
    
        // if answer is true
            // increment totalCorrect
            // increment currentQuestion
            // - - change button color if we have time
        // else answer is false
            // increment current question
            // - - change button color if we have time
        // end ifelse

  
    
    // select question function
        // randomlize list and create an array
        // sending to the while loop
        // delete from the array of dictionaries.
    // end function
    
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
