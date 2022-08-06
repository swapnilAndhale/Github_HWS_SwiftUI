//
//  Movie+CoreDataProperties.swift
//  CoreDataProject
//
//  Created by Swapnil on 05/08/22.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var director: String?
    @NSManaged public var year: Int16
    
    public var wrappedTitle: String {
        title ?? "Unknow Title"
    }

}

extension Movie : Identifiable {

}
