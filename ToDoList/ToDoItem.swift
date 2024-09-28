//
//  Item.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import Foundation
import SwiftData

@Model
final class ToDoItem: Identifiable, ObservableObject {
    var id: UUID = UUID()
    var timestamp: Date
    var title: String
    var summary: String
    var isCompleted: Bool
    
    init (timestamp: Date, title: String, summary: String, isCompleted: Bool) {
        self.timestamp = timestamp
        self.title = title
        self.summary = summary
        self.isCompleted = isCompleted
    }
}
