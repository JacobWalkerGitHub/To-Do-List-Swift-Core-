import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var items: [ToDoItem]
    
    @State private var addToDoItem = false
    @State private var viewToDoItem = false
    @State private var isEditing: Bool = true
    @State private var hasCompletedTasks: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack {
                ZStack {
                    VStack {
                        header
                        ScrollView {
                            VStack {
                                ForEach(items) { item in
                                    if !item.isCompleted {
                                        NavigationLink {
                                            ToDoItemView(item: item, isEditing: $isEditing)
                                        } label: {
                                            ToDoListView(item: item)
                                        }
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                if hasCompletedTasks {
                                    VStack(alignment: .leading) {
                                        Text("Completed")
                                            .foregroundStyle(.white)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .padding(.horizontal)
                                            .padding(.top, 50)
                                    }
                                    
                                    ForEach(items) { item in
                                        if item.isCompleted {
                                            NavigationLink {
                                                ToDoItemView(item: item, isEditing: $isEditing)
                                            } label: {
                                                ToDoListView(item: item)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .frame(width: 75, height: 75)
                                .foregroundStyle(Color(.systemGray5))
                                .shadow(color: .black, radius: 5.0)
                            
                            Image(systemName: "plus")
                                .font(.title)
                                .foregroundStyle(Color("Background"))
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
            .onAppear {
                // Check for completed tasks when the view appears
                updateHasCompletedTasks()
            }
            .onChange(of: items) { _ in
                // Check for completed tasks when items change
                updateHasCompletedTasks()
            }
        }
    }
    
    private func updateHasCompletedTasks() {
        // Update hasCompletedTasks based on the current items
        hasCompletedTasks = items.contains { $0.isCompleted }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDoItem.self, inMemory: true)
}

extension ContentView {
    var header: some View {
        HStack {
            Text("To Do")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal)
    }
}
