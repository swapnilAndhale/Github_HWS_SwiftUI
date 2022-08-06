//
//  ContentView.swift
//  Instafilter
//
//  Created by Swapnil on 06/08/22.
//

import SwiftUI

struct ContentView: View {
    @State private var blurAmount = 0.0 {
        didSet {
            print("New value is \(blurAmount)")
        }
    }
    var body: some View {
        VStack {
            Text("Hello, world")
                .blur(radius: blurAmount)
            
            Slider(value: $blurAmount, in: 0...20)
            
            Button("Ramdom Blur") {
                blurAmount = Double.random(in: 0...20)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
