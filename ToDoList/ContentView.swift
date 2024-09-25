//
//  ContentView.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ToDoItem]
    
    @State private var addToDoItem = false
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    header
                    ScrollView {
                        ForEach(items) { item in
                            let newItem = item
                            ToDoListView(item: newItem)
                        }
                        .onDelete(perform: deleteItems)
                    }
                }
                
                
                HStack {
                    ZStack {
                        Circle()
                            .frame(width: 75, height: 75)
                            .foregroundStyle(.blue)
                            .shadow(color: .black, radius: 5.0)
                        
                        
                        Image(systemName: "plus")
                            .font(.title)
                            .foregroundStyle(.white)
                            .frame(width: 75, height: 75)
                            .onTapGesture {
                                withAnimation(.spring()) {
                                    addToDoItem.toggle()
                                }
                            }
                    }
                    .position(x: 350, y: UIScreen.main.bounds.height - 125)
                    .transition(.scale)
                }
                
            }
        }
        .background(Color("Background"))
        
        .sheet(isPresented: $addToDoItem) {
            ToDoView(addToDo: $addToDoItem)
        }
    }
    
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            for index in offsets {
                modelContext.delete(items[index])
            }
        }
    }
}
#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}

extension ContentView  {
    var header: some View {
        HStack {
            Text("To Do")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
            EditButton()
                .foregroundStyle(.white)
                .font(.title3)
        }
        .padding(.horizontal)
    }
}


