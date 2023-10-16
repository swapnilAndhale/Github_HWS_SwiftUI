//
//  ContentView.swift
//  Per Head
//
//  Created by Swapnil on 16/10/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("form 1")
                    Text("Form 2")
                }
                Section {
                    Text("Form 3")
                }
                
            }
            .navigationTitle("Per Head")
        }
    }
}

#Preview {
    ContentView()
}
