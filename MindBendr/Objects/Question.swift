//
//  Question.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 5/14/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//

import Foundation

class Question: NSObject {
  public var text: String!
  public var answers: [Answer]!
  
  init(text: String, answers: [Answer]) {
    super.init()
    self.text = text
    self.answers = answers
  }
}
