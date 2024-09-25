//
//  ToDoListView.swift
//  ToDoList
//
//  Created by Jacob Walker on 9/25/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    var item: ToDoItem
    
    init(item: ToDoItem) {
        self.item = item
    }
    
    var body: some View {
        VStack {
            HStack {
                
                Button {
                    item.isCompleted.toggle()
                } label: {
                    HStack {
                        
                        if !item.isCompleted {
                            
                            Image(systemName: "circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 25))
                                .padding(.trailing)
                                .padding(.leading)
                            
                        } else {
                            Image(systemName: "checkmark.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 25))
                                .padding(.trailing)
                                .padding(.leading)
                        }
                        Divider()
                            .background(.white)
                            .frame(height: 50)
                    }
                }

                
                
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .fontWeight(.bold)
                    Text("item.timestamp")
                        .font(.headline)
                        .foregroundStyle(Color(.systemGray2))
                }
                
                Spacer()
                Image(systemName: "chevron.right")
                    .foregroundStyle(.white)
                    .font(.system(size: 25))
            }
            .padding(.trailing, 30)
            .frame(width: .infinity, height: 75)
        }
        .background(Color("Background"))
    }
}

//#Preview {
//    ToDoListView()
//}
