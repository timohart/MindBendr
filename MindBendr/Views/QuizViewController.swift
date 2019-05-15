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
  
    var currentQuestionNumber = 1
    var userCorrect = 0
  
    var currentQuestion : Question?

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
  
    // MARK: - Class Lets
    let totalQuestions = 10
  
  // MARK: - Outlets
    @IBOutlet weak var currentQuestionCounter: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
  
    @IBOutlet weak var quizViewLabel: UILabel!
    @IBOutlet weak var answer1Btn: UIButton!
    @IBOutlet weak var answer2Btn: UIButton!
    @IBOutlet weak var answer3Btn: UIButton!
    
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
      
        if let path : String = Bundle.main.path(forResource: "preloadedData", ofType: "plist")! {
          questionsArray = NSArray(contentsOfFile: path)! as [AnyObject] as NSArray
        }
      
      questionLabel()
      
      setupGame()
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
  
  @IBAction func AnswerButtonClick(_ sender: UIButton) {
    var isCorrect : Bool = false
    
    for answer in currentQuestion!.answers {
      if answer.text == sender.titleLabel?.text {
        if answer.isCorrect {
          isCorrect = true
        }
      }
    }
    
    if isCorrect {
      currentScore = currentScore + 1
    }

    loadQuestion()
  }
  
  // MARK: - Supporting Func
  
    func questionLabel () {
        
    currentQuestionCounter.text = "\(currentQuestionNumber) of \(totalQuestions)"
    
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
      
      loadQuestion()
    }
  
  
  func loadQuestion() {
    if currentQuestionNumber <= totalQuestions {
      currentQuestion = selectCurrentQuestion()
      
      quizViewLabel.text = currentQuestion!.text
      
      loadAnswers()
    } else {
      endGame()
    }
  }
  
  func loadAnswers() {
    var usedAnswers = [Int]()
    
    while (usedAnswers.count < (currentQuestion?.answers.count)!) {
      let selectedNum = Int.random(in: 0...(currentQuestion?.answers.count)!)
      if (!usedAnswers.contains(selectedNum)) {
        usedAnswers.append(selectedNum)
        
        switch selectedNum {
        case 0:
          answer1Btn.setTitle(currentQuestion?.answers[selectedNum].text, for: .normal)
        case 1:
          answer2Btn.setTitle(currentQuestion?.answers[selectedNum].text, for: .normal)
        case 2:
          answer3Btn.setTitle(currentQuestion?.answers[selectedNum].text, for: .normal)
        default:
          print("Error!!")
        }
      } // if
    } // While
  }
  
  func endGame() {
//    viewDidAppear(true)
    self.performSegue(withIdentifier: "ScoreSegue", sender: self)
  }
  
  override func viewDidAppear(_ animated: Bool)  {
    super.viewDidAppear(animated)
    performSegue(withIdentifier: "ScoreSegue", sender: nil)
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
  
  func selectCurrentQuestion() -> Question {
    var selectedQuestion : Question?
    var qText : String?
    var answers : [Answer]?
    
    while (selectedQuestion == nil) {
      let selectedNum = Int.random(in: 0...questionsArray.count)
      if (!usedQuestions.contains(selectedNum)) {
        usedQuestions.append(selectedNum)
        
        if let question = questionsArray[selectedNum] as? [String:AnyObject] {
          qText = question["qText"] as? String
          answers = getAnswers(aDic: question["answers"] as! [[String : AnyObject]])
          
          selectedQuestion = Question(text: qText!, answers: answers!)
        }
      } // if
    } // While
    return selectedQuestion!
  } // func sCQ
  
  func getAnswers(aDic : [[String:AnyObject]]) -> [Answer] {
    var answers = [Answer]()
    
    for answer in aDic {
      answers.append(Answer(text: (answer["text"] as? String)!, isCorrect: (answer["isCorrect"] as? Bool)!))
    }
    
    return answers
  }

  // MARK: - breathing with Timo
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
  
   // MARK: - Navigation
   
// In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ScoreViewController" {
        // Get a reference to the destination view controller for this segue and set its author property to the currently selected author in the table view that was obtained in the nested if portion of the optional binding chain above...
        let destinationViewController = segue.destination as! ScoreViewController

        // set booksTableViewController's author property
        destinationViewController.score = currentScore
        destinationViewController.numberOfQuestions = totalQuestions
    }
   }
  
}
