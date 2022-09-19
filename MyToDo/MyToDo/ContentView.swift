//
//  ContentView.swift
//  MyToDo
//
//  Created by Swapnil on 19/09/22.
//

import SwiftUI

struct ContentView: View {
    @State var todoItems: [ToDoItem] = []
    
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
                        //code
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.largeTitle)
                            .foregroundColor(.purple)
                    }
                }
                .padding()
                
            }
            .rotation3DEffect(Angle(degrees: <#T##Double#>), axis: <#T##(x: CGFloat, y: CGFloat, z: CGFloat)#>)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
