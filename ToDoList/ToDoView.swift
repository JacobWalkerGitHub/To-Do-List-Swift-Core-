//
//  ToDoView.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/23/24.
//

import SwiftUI

struct ToDoView: View {
    @Environment(\.modelContext) private var modelContext
    
    @State private var title: String = ""
    @State private var date: Date = Date()
    @State private var summary: String = ""
    
    @Binding var addToDo: Bool
    
    var body: some View {
        
        VStack {
            Spacer()
            TextField("Title", text: $title)
                .padding()
                .foregroundStyle(.black)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(radius: 5.0, x: 0, y: 5.0)
                .padding(.horizontal)
                .font(.headline)
                .padding(.bottom, 75)
                .padding(.top, 25)
            
            DatePicker("Select a date", selection: $date)
                .padding()
                .foregroundStyle(.black)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(radius: 5.0, x: 0, y: 5.0)
                .padding(.horizontal)
                .padding(.bottom, 40)
            
            TextField("Summary", text: $summary)
                .frame(width: .infinity, height: 100)
                .padding()
                .foregroundStyle(.black)
                .background(Color(.systemGray6))
                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                .shadow(radius: 5.0, x: 0, y: 5.0)
                .padding(.horizontal)
            Spacer()
            VStack {
                Button {
                    let newItem = ToDoItem(timestamp: date, title: title, summary: summary, isCompleted: false)
                    modelContext.insert(newItem)
                    addToDo = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(height: 50)
                            .foregroundStyle(.blue)
                            .shadow(radius: 10.0)
                        
                        Text("Add")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                }
                
                Button {
                    addToDo = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                                    .stroke(.black, lineWidth: 2)
                                    .frame(height: 50)
                                    .foregroundStyle(.clear)
                                    .shadow(radius: 10.0)
                        
                        Text("Cancel")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .fontWeight(.semibold)
                    }
                    .padding(.horizontal)
                    
                }
            }
            
            Spacer()
        }
        .ignoresSafeArea(.all)
        .background(Color("Background"))
    }
}

#Preview {
    ToDoView(addToDo: .constant(true))
}
