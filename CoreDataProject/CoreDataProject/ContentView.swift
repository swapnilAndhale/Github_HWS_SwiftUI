//
//  ContentView.swift
//  CoreDataProject
//
//  Created by Swapnil on 03/08/22.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    
    @FetchRequest(sortDescriptors: []) var movie: FetchedResults<Movie>
    var body: some View {
        Text("Hello, world!")
            .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
