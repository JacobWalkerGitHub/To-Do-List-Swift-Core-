//
//  Item.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import Foundation
import SwiftData

@Model
final class ToDoItem: Identifiable {
    var id: UUID = UUID()
    var timestamp: Date
    var title: String
    var sumarry: String
    var isCompleted: Bool
    
    init (timestamp: Date, title: String, sumarry: String, isCompleted: Bool) {
        self.timestamp = timestamp
        self.title = title
        self.sumarry = sumarry
        self.isCompleted = isCompleted
    }
}
