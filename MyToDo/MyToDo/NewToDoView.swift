//
//  NewToDoView.swift
//  MyToDo
//
//  Created by Swapnil on 19/09/22.
//

import SwiftUI

struct NewToDoView: View {
    @Environment(\.managedObjectContext) var moc
    @Binding var isShow: Bool
    
    @State var name: String
    @State var priority: Priority
    @State var isEditing = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack(alignment: .leading) {
                HStack {
                    Text("Add new task")
                        .font(.system(.title, design: .rounded))
                        .bold()
                    
                    Spacer()
                    
                    Button {
                        self.isShow = false
                    } label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .font(.headline)
                    }
                }
                TextField("Enter the task discription", text: $name, onEditingChanged: { editingChanged in
                    self.isEditing = editingChanged
                })
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.bottom)
                
                Text("Priority")
                    .font(.system(.subheadline, design: .rounded))
                    .padding(.bottom)
                
                
                HStack {
                    Text("High")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .high ? Color.red : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .high
                        }
                    
                    Text("Normal")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .normal ? Color.orange : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .normal
                        }
                    
                    Text("Low")
                        .font(.system(.headline, design: .rounded))
                        .padding(10)
                        .background(priority == .low ? Color.green : Color(.systemGray4))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                        .onTapGesture {
                            self.priority = .low
                        }
                }
                .padding(.bottom, 30)
                
                // Save button for adding the todo item
                Button {
                    if self.name.trimmingCharacters(in: .whitespaces) == "" {
                        return
                    }
                    self.isShow = false
                    self.addTask(name: self.name, priority: self.priority)
                } label: {
                    Text("Save")
                        .font(.system(.headline, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.purple)
                        .cornerRadius(10)
                }
                .padding(.bottom)
            }
            .padding()
            .background(Color.white)
            .cornerRadius(10, antialiased: true)
            .offset(y: isEditing ? -320 : 0)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    private func addTask(name: String, priority: Priority, isComplete: Bool = false) {
        let task = ToDoItem(context: moc)
        task.id = UUID()
        task.name = name
        task.priority = priority
        task.isComplete = isComplete
        
        do {
            try moc.save()
        } catch {
            print(error)
        }
    }
}


struct NewToDoView_Previews: PreviewProvider {
    static var previews: some View {
        NewToDoView(isShow: .constant(true), name: "", priority: .normal)
    }
}
