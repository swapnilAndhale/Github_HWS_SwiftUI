//
//  ContentView.swift
//  MyToDo
//
//  Created by Swapnil on 19/09/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    
    @FetchRequest(entity: ToDoItem.entity(), sortDescriptors: [ NSSortDescriptor(keyPath: \ToDoItem.priorityNum, ascending: false)])
    private var todoItems: FetchedResults<ToDoItem>
    
    @State private var newItemName: String = ""
    @State private var newItemPriority: Priority = .normal
       
    @State private var showNewTask = false
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("MyToDo List")
                        .font(.system(size: 40,weight: .black, design: .rounded))
                    Spacer()
                    
                    Button {
                        self.showNewTask = true
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                }
                .padding()
                
                List {
                    ForEach(todoItems) { todoItem in
                        ToDoListRow(todoItem: todoItem)
                    }
                }
                
            }
            .rotation3DEffect(Angle(degrees: showNewTask ? 5 : 0), axis: (x: 1, y: 0, z: 0))
            .offset(y: showNewTask ? -50: 0)
            .animation(.easeOut)
            
            //if there is no data, then show an empty view
            if todoItems.count == 0 {
                NoDataView()
            }
            
            //Display the "add new todo" view
            if showNewTask {
                BlankView(bgColor: .black)
                    .opacity(0.5)
                    .onTapGesture {
                        self.showNewTask = false
                    }
                
                NewToDoView(isShow: $showNewTask, name: "", priority: .normal)
                    .transition(.move(edge: .bottom))
                    .animation(.interpolatingSpring(stiffness: 200.0, damping: 25.0, initialVelocity: 10.0))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct BlankView: View {
    var bgColor: Color
    var body: some View {
        VStack {
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(bgColor)
        .edgesIgnoringSafeArea(.all)
    }
}

struct NoDataView: View {
    var body: some View {
        Image("welcome")
            .resizable()
            .scaledToFit()
    }
}
