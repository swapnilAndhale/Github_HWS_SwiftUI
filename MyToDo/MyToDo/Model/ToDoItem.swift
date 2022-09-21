//
//  ToDoItems.swift
//  MyToDo
//
//  Created by Swapnil on 19/09/22.
//

import Foundation
import CoreData

public class ToDoItem: NSManagedObject {
    
    @NSManaged public var id: UUID
    @NSManaged public var name: String
    @NSManaged public var priorityNum: Int32
    @NSManaged public var isComplete: Bool
}
extension ToDoItem: Identifiable {
    var priority: Priority {
        get {
            return Priority(rawValue: Int(priorityNum)) ?? .normal
        }
        set {
            self.priorityNum = Int32(newValue.rawValue)
        }
    }
}

enum Priority: Int {
    case low = 0
    case normal = 1
    case high = 2
}
