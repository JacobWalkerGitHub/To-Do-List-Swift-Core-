//
//  Item.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
