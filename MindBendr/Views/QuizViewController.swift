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
  
  // MARK: - Class Vars
    var breathingWithTimo: AVAudioPlayer?
  
    var currentQuestion = 1
    var totalQuestions = 10
    var userCorrect = 0
  
  // timer variables
    var seconds = 0
    var timer = Timer()
    var timerText = "Time: "
  
  // score variables
    var score = 0
    var currentScore = 0
  
  // question variables
    var changeQuestion = false
    var usedQuestions : [Int] = []
  
    @IBOutlet weak var quizViewLabel: UILabel!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
  
    // MARK: - Class Lets
  
  // MARK: - Outlets
    @IBOutlet weak var currentQuestionCounter: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    
    
    // MARK: - Arrays
    private var questionsArray: NSArray!
    private var answersArray: NSArray!
  
  // MARK: - At Load
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // create audio player and assing to instance variable
        if let timoBreathe = self.setUpAudioPlayerWithFile("breatheWithTimo","mp3"){
            self.breathingWithTimo = timoBreathe
        }
            
        questionLabel()
        
        setupGame()
      
        if let path : String = Bundle.main.path(forResource: "preloadedData", ofType: "plist")! {
          questionsArray = NSArray(contentsOfFile: path)! as [AnyObject] as NSArray
        }
      
        runGame()
    }

  // MARK: - IBActions

    @IBAction func breathingButton(_ sender: Any) {
        
        if breathingWithTimo!.isPlaying {
            
            breathingWithTimo?.stop()
            
        } else {
            
            breathingWithTimo?.play()
            breathingWithTimo?.volume = 0.6
            
        }

    }
    
    // grab reference to plist chosen and create an array of dictionaries
    func getPlist(withName name: String) -> [String]? {
        if  let path = Bundle.main.path(forResource: name, ofType: "plist"),
            let xml = FileManager.default.contents(atPath: path) {
            return (try? PropertyListSerialization.propertyList(from: xml, options: .mutableContainersAndLeaves, format: nil)) as? [String]
        }
        
        return nil
        
    }
  
    //var quizQuestions = getPlist("preloadedData")
    
    // while current question <= totalQuesions
    
        // selectQuestion()
    
        // take randomized list of quizQuestions grab variable qText to display in questionLabel
    
        // grab the answers array associated with that question - could randomize as well
        // display answerOptions on buttons for user to select from
    
        // if answer is true
            // increment totalCorrect
            // increment currentQuestion
            // - - change button color if we have time
        // else answer is false
            // increment current question
            // - - change button color if we have time
        // end ifelse
    
    
    // func selectQuestion(pass in quizQuestions)
        // randomlize list and create an array
        // sending to the while loop
        // delete from the array of dictionaries.
    // end function

    // quiz label (top of screen) is pulls text matching name of the button pressed
    
    // output to currentQuestionLabel the currentQuestion of totalQuestions
  
  // MARK: - Supporting Func
  
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
      var questionNumber = 1
      while questionNumber <= 10 {
        let selectedQuestion : [String: AnyObject] = selectCurrentQuestion()
        
        quizViewLabel.text = selectedQuestion["qText"] as? String
        
        if let answersArray = selectedQuestion["answers"] as? [AnyObject] as NSArray? {
          var answersFilled = 0
          
          for answer in answersArray {
            if let answerDic = answer as? [String: AnyObject] {
              switch answersFilled {
              case 0:
                answer1Btn.setTitle(answerDic["text"] as? String, for: .normal)
              case 1:
                answer2Btn.setTitle(answerDic["text"] as? String, for: .normal)
              case 2:
                answer3Btn.setTitle((answerDic["text"] as! String), for: .normal)
              default:
                print("error in loading answers")
              }
            }
            answersFilled = answersFilled + 1
          }
        }
        questionNumber = questionNumber + 1
      }
    }
  
  func endGame() {
    
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
  
  func selectCurrentQuestion() -> [String: AnyObject] {
    var selectedQuestion : [String: AnyObject]?
    
    while (selectedQuestion == nil) {
      let selectedNum = Int.random(in: 0...questionsArray.count)
      if (!usedQuestions.contains(selectedNum)) {
        usedQuestions.append(selectedNum)

        if let question = questionsArray[selectedNum] as? [String:AnyObject] {
          selectedQuestion = question
        }
      } // if
    } // While
    return selectedQuestion!
  } // func sCQ
}
