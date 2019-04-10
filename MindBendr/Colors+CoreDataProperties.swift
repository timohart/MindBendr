//
//  Colors+CoreDataProperties.swift
//  MindBendr
//
//  Created by Timothy Hartwig Student on 4/10/19.
//  Copyright © 2019 CVTC Spring 2019 Capstone. All rights reserved.
//
//

import Foundation
import CoreData


extension Colors {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Colors> {
        return NSFetchRequest<Colors>(entityName: "Colors")
    }

    @NSManaged public var alpha: Double
    @NSManaged public var blue: Int16
    @NSManaged public var colorID: Int16
    @NSManaged public var green: Int16
    @NSManaged public var red: Int16
    @NSManaged public var coloringAText: NSSet?
    @NSManaged public var coloringQText: NSSet?

}

// MARK: Generated accessors for coloringAText
extension Colors {

    @objc(addColoringATextObject:)
    @NSManaged public func addToColoringAText(_ value: Answer)

    @objc(removeColoringATextObject:)
    @NSManaged public func removeFromColoringAText(_ value: Answer)

    @objc(addColoringAText:)
    @NSManaged public func addToColoringAText(_ values: NSSet)

    @objc(removeColoringAText:)
    @NSManaged public func removeFromColoringAText(_ values: NSSet)

}

// MARK: Generated accessors for coloringQText
extension Colors {

    @objc(addColoringQTextObject:)
    @NSManaged public func addToColoringQText(_ value: Question)

    @objc(removeColoringQTextObject:)
    @NSManaged public func removeFromColoringQText(_ value: Question)

    @objc(addColoringQText:)
    @NSManaged public func addToColoringQText(_ values: NSSet)

    @objc(removeColoringQText:)
    @NSManaged public func removeFromColoringQText(_ values: NSSet)

}
