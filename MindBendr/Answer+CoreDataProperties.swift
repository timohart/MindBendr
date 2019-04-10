//
//  Answer+CoreDataProperties.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 4/10/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//
//

import Foundation
import CoreData


extension Answer {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Answer> {
        return NSFetchRequest<Answer>(entityName: "Answer")
    }

    @NSManaged public var answerID: Int16
    @NSManaged public var answerText: String?
    @NSManaged public var colorID: Int16
    @NSManaged public var aToQ: Question?
    @NSManaged public var colorTextA: Colors?

}
