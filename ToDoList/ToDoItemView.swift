//
//  ToDoItemView.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/26/24.
//

import SwiftUI

struct ToDoItemView: View {
    @Environment(\.dismiss) var dismiss
    
    var item: ToDoItem
    
//    private var formattedDate: String {
//            let formatter = DateFormatter()
//            formatter.dateStyle = .medium
//            formatter.timeStyle = .short
//            return formatter.string(from: item.timestamp)
//        }
    
    @State private var isEditing = false
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.title)
                        .foregroundStyle(.white)
                }
                
                Spacer()
                
                Button {
                    isEditing.toggle()
                } label: {
                    Image(systemName: "ellipsis")
                        .font(.title)
                        .foregroundStyle(.white)
                }
            }
            .padding()
            
            VStack(alignment: .leading) {
                
                ZStack(alignment: .leading) {
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 75)
                        .foregroundStyle(Color("Foreground"))
                        .shadow(radius: 10.0, x: 0, y: 10)
                    
                    Text(item.title)
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
                    
                    Text("formattedDate")
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
                    
                    Text(item.sumarry)
                        .font(.title3)
                        .foregroundStyle(.white)
                        .padding()
                }
                .padding(.vertical)
                
                
            }
            .padding(.horizontal)
            
            
            Button {
                item.isCompleted.toggle()
            } label: {
                if !item.isCompleted {
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
                } else {
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
                }
            }
            
            Spacer()
        }
        .background(Color("Background"))
        .navigationBarBackButtonHidden(true)
        
        .sheet(isPresented: $isEditing) {
            
            VStack(spacing: 20) {
                Spacer()

                Button {
                    // Edit action
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
                    // Delete action
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
