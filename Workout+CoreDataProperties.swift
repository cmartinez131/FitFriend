//
//  Workout+CoreDataProperties.swift
//  FitFriend
//
//  Created by Christopher Martinez on 11/30/22.
//
//

import Foundation
import CoreData


extension Workout {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workout> {
        return NSFetchRequest<Workout>(entityName: "Workout")
    }

    @NSManaged public var name: String?
    @NSManaged public var desc: String?

}

extension Workout : Identifiable {

}
