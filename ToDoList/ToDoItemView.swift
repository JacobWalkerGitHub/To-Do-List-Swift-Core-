//
//  ToDoItemView.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/26/24.
//

import SwiftUI

struct ToDoItemView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    
    var item: ToDoItem
    
    @State private var isCompleted: Bool = false
    @State private var title: String = ""
    @State private var sumarry: String = ""
    @State private var date = Date()
    
    @Binding var isEditing: Bool
    
    @State private var openSetting: Bool = false
    private var formattedDate: String {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .short
        return formatter.string(from: item.timestamp)
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Button {
                    dismiss()
                    if !isEditing {
                        isEditing.toggle()
                    }
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                    Button {
                        openSetting.toggle()
                    } label: {
                        if openSetting {
                            Image(systemName: "checkmark")
                                .font(.title)
                                .foregroundStyle(.white)
                        } else {
                            Image(systemName: "ellipsis")
                                .font(.title)
                                .foregroundStyle(.white)
                        }
                    }
                
            }
            .padding()
            
            VStack(alignment: .leading) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 75)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    TextField(title, text: $title, prompt: Text("Title").foregroundStyle(.white))
                        .font(.title)
                        .disabled(isEditing)
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
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .disabled(isEditing)
                        .colorScheme(.dark)
                        .fontWeight(.semibold)
                        .font(.title2)
                }
                .padding(.vertical)
                
                
                ZStack(alignment: .topLeading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 200)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    TextField(sumarry, text: $sumarry, prompt: Text("Notes").foregroundStyle(.white), axis: .vertical)
                        .font(.title3)
                        .disabled(isEditing)
                        .lineLimit(6)
                        .foregroundStyle(.white)
                        .padding()
                        
                        
                    
                }
                .padding(.vertical)
                
                
            }
            .padding(.horizontal)
            
            if isEditing {
                Button {
                    item.isCompleted.toggle()
                } label: {
                    if !isCompleted {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 50)
                                .foregroundStyle(Color(.systemGray5))
                                .shadow(radius: 10.0, x: 0, y: 10)
                            
                            Text("Complete")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Background"))
                                .padding()
                        }
                        .padding()
                    } else {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .frame(height: 50)
                                .foregroundStyle(Color(.systemGray5))
                                .shadow(radius: 10.0, x: 0, y: 10)
                            
                            Text("Completed")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .foregroundStyle(Color("Background"))
                                .padding()
                        }
                        .padding()
                    }
                }
            } else {
                Button {
                    item.title = title
                    item.timestamp = date
                    item.summary = sumarry
                    item.isCompleted = isCompleted
                    isEditing.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .frame(height: 50)
                            .foregroundStyle(Color(.systemGray5))
                            .shadow(radius: 10.0, x: 0, y: 10)
                        
                        Text("Save")
                            .font(.title2)
                            .fontWeight(.semibold)
                            .foregroundStyle(Color("Background"))
                            .padding()
                    }
                    .padding()
                }
            }
            
            Spacer()
        }
        .background(Color("Background"))
        .navigationBarBackButtonHidden(true)
        
        .onAppear {
            isCompleted = item.isCompleted
            date = item.timestamp
            sumarry = item.summary
            title = item.title
        }
        .onChange(of: item.isCompleted, { oldValue, newValue in
            isCompleted = item.isCompleted
        })
        
        .sheet(isPresented: $openSetting) {
            
            VStack(spacing: 20) {
                Spacer()
                
                Button {
                    isEditing.toggle()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundStyle(Color("Foreground"))
                            .shadow(radius: 10.0, x: 0, y: 10)
                        
                        Text("Edit")
                            .font(.title2)
                            .foregroundStyle(.primary)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)
                
                Button {
                    openSetting.toggle()
                    modelContext.delete(item)
                    dismiss()
                } label: {
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .frame(height: 50)
                            .foregroundStyle(Color(.systemRed).opacity(0.2))
                            .shadow(radius: 10.0, x: 0, y: 10)
                        
                        Text("Delete")
                            .font(.title2)
                            .foregroundStyle(.red)
                            .fontWeight(.semibold)
                    }
                }
                .padding(.horizontal)
                Spacer()
            }
            .padding(.top, 20)
            .background(Color("Background"))
            .presentationDetents([.fraction(0.3)])
        }
        
    }
    
}

//#Preview {
//    ToDoItemView()
//}
