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
        
        VStack(alignment: .leading) {
            
            VStack(alignment: .leading) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 75)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    TextField("Title", text: $title)
                        .font(.title)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                        .padding()
                }
                .padding(.vertical)
                
                
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 75)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    DatePicker("Date", selection: $date)
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundStyle(Color(.systemGray5))
                        .padding()
                }
                .padding(.vertical)
                
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 200)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    TextField("Notes", text: $summary)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding()
                    
                }
                .padding(.vertical)
                
                
            }
            .padding(.horizontal)
            VStack {
                Button {
                    let newItem = ToDoItem(timestamp: date, title: title, summary: summary, isCompleted: false)
                    modelContext.insert(newItem)
                    addToDo = false
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15.0)
                            .frame(height: 50)
                            .foregroundStyle(Color(.systemGray5))
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
