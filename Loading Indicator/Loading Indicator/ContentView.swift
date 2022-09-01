//
//  ContentView.swift
//  Loading Indicator
//
//  Created by Swapnil on 01/09/22.
//

import SwiftUI

struct ContentView: View {
    @State private var isLoading = false
    
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                Rectangle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .scaleEffect(isLoading ? 0.9 : 1)
                    .offset(x: isLoading ? 240 : -200 , y: 0)
                    .animation(Animation.easeInOut(duration: 2).repeatForever(autoreverses: false).delay(0.2 * Double(index)))
                
                    
            }
        }
        .onAppear() {
            self.isLoading = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
