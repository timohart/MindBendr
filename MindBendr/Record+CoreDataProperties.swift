//
//  Record+CoreDataProperties.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 4/10/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//
//

import Foundation
import CoreData


extension Record {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Record> {
        return NSFetchRequest<Record>(entityName: "Record")
    }

    @NSManaged public var correct: Int16
    @NSManaged public var date: NSDate?
    @NSManaged public var gameID: Int32
    @NSManaged public var incorrect: Int16

}
