//
//  ToDoListRow.swift
//  MyToDo
//
//  Created by Swapnil on 21/09/22.
//

import SwiftUI

struct ToDoListRow: View {
    @Environment(\.managedObjectContext) var moc
    @ObservedObject var todoItem: ToDoItem
    
    var body: some View {
        Toggle(isOn: self.$todoItem.isComplete) {
            HStack {
                Text(self.todoItem.name)
                    .strikethrough(self.todoItem.isComplete, color: .black)
                    .bold()
                    .animation(.default)
                
                Spacer()
                
                Circle()
                    .frame(width: 10,height: 10)
                    .foregroundColor(self.color(for: self.todoItem.priority))
            }
        }
        .toggleStyle(CheckboxStyle())
        .onReceive(todoItem.objectWillChange, perform: { _ in
            if self.moc.hasChanges {
                try? self.moc.save()
            }
        })
    }
    
    private func color(for priority: Priority) -> Color {
        switch priority {
        case .high: return .red
        case .normal: return .orange
        case .low: return .green
        }
    }
}
