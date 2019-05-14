//
//  ScoreViewController.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 5/14/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
  
  var score = 0
  var numberOfQuestions = 0

  @IBOutlet weak var scoreLabel: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    scoreLabel.text = "\(score) / \(numberOfQuestions)"
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
