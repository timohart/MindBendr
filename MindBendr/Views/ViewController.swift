//
//  ViewController.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 3/27/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // MARK: - IBACTIONS
    @IBAction func NerdQuizButton(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueToQuiz", sender: self)
        
    }
    
    
    @IBAction func geekQuizButton(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueToQuiz", sender: self)
        
    }
  
    @IBAction func scoresButton(_ sender: UIButton) {
      var records :[NSManagedObject] = []
      
      guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
      
      let managedContext = appDelegate.persistentContainer.viewContext
      
      let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "Record")
      
      do {
        records = try managedContext.fetch(fetchRequest)
      } catch {
        fatalError("Failed to fetch records: \(error)")
      }
      
      if records.count > 0 {
        performSegue(withIdentifier: "scoreSegue", sender: self)
      } else {
        showAlert(title: "No Scores yet", message: "You have not completed any quizes yet. Once you have completes a quiz or more, then you can see past score and stats.")
      }
    }
    
    ////////@IBAction func enterButton(_ sender: Any) {
        
        
    ////////}
    // quiz button is pressed
    
    //
    // variables
    //
    // var currentQuestion = 0
    // var totalQuestions = count of total questions for that quiz
    // var userCorrect = 0
    
    // quiz label (top of screen) is pulls text matching name of the button pressed
    
    // increment current question viariable by 1 and
    
    // output to currentQuestionLabel the currentQuestion of totalQuestions
    
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
    
  func showAlert(title: String, message: String){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    let action = UIAlertAction(title: "Okay", style: .default, handler: nil)
    
    alert.addAction(action)
    
    present(alert, animated: true, completion: nil)
  }
    
}

