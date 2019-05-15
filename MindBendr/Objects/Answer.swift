//
//  Answer.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 5/14/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import UIKit

class Answer: NSObject {
  public var text: String!
  public var isCorrect: Bool!
  
  init(text: String, isCorrect: Bool) {
    super.init()
    self.text = text
    self.isCorrect = isCorrect
  }
}
