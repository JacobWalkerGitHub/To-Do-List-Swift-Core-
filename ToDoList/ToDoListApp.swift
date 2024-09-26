//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
                .modelContainer(for: ToDoItem.self)
        }
    }
}

