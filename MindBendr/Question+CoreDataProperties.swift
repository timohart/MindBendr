//
//  Question+CoreDataProperties.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 4/10/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//
//

import Foundation
import CoreData


extension Question {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Question> {
        return NSFetchRequest<Question>(entityName: "Question")
    }

    @NSManaged public var catigoryID: Int16
    @NSManaged public var colorID: Int16
    @NSManaged public var questionID: Int16
    @NSManaged public var questionLevel: Int16
    @NSManaged public var questionText: String?
    @NSManaged public var qToA: NSSet?
    @NSManaged public var coloredTextQ: Colors?

}

// MARK: Generated accessors for qToA
extension Question {

    @objc(addQToAObject:)
    @NSManaged public func addToQToA(_ value: Answer)

    @objc(removeQToAObject:)
    @NSManaged public func removeFromQToA(_ value: Answer)

    @objc(addQToA:)
    @NSManaged public func addToQToA(_ values: NSSet)

    @objc(removeQToA:)
    @NSManaged public func removeFromQToA(_ values: NSSet)

}
