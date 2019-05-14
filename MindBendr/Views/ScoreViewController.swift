//
//  ScoreViewController.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 5/14/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit
import CoreData

class ScoreViewController: UIViewController {
  
  var score = 0
  var numberOfQuestions = 0

  @IBOutlet weak var scoreLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scoreLabel.text = "\(score) / \(numberOfQuestions)"
    
    saveScore()
  }
  
  func saveScore() {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    let context = appDelegate.persistentContainer.viewContext
    
    let entity = NSEntityDescription.entity(forEntityName: "Record", in: context)
    let newScore = NSManagedObject(entity: entity!, insertInto: context)
    
    newScore.setValue(score, forKey: "correct")
    newScore.setValue(numberOfQuestions - score, forKey: "incorrect")
    newScore.setValue("nerdQuiz", forKey: "quizName")
    newScore.setValue(Date(), forKey: "date")
    
    do {
      try context.save()
    } catch {
      print("Failed saving")
    }
  }

  /*
  // MARK: - Navigation

  // In a storyboard-based application, you will often want to do a little preparation before navigation
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
  }
  */

}
