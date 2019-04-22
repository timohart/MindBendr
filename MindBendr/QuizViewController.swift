//
//  QuizViewController.swift
//  MindBendr
//
//  Created by Julia Klimeck on 4/22/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {
    
    
    @IBOutlet weak var currentQuestionCounter: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        questionLabel()
       
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    // quiz button is pressed
    
    //
    // variables
    //
    
    var currentQuestion = 1
    var totalQuestions = 10
    var userCorrect = 0
    
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
    
    
    // Timer Function
    // At question 10 timer counts down to end screen
    
    
    
}
