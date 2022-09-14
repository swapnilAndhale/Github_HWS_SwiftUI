//
//  ContentView.swift
//  Animations
//
//  Created by Swapnil on 15/06/22.
//

import SwiftUI

/*
struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {

    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading))
    }
}

*/
struct ContentView: View {
    
    
    let letters = Array("Hello, Swapnil")
    //@State private var animationAmount = 0.0
    @State private var enable = false
    @State private var dragAmount = CGSize.zero
    //@State private var isShowingYellow = false
    
    var body: some View {
       
        /*
        //Rectangle Animation
        
        ZStack {
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
            if isShowingYellow {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 200, height: 200)
                    .transition(.pivot)
            }
        }
        .onTapGesture {
            withAnimation {
                isShowingYellow.toggle()
            }
        }
        
        VStack {
            Button("Tap me") {
                isShowingYellow.toggle()
            }
            if isShowingYellow {
                Rectangle()
                    .fill(.yellow)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
*/
        
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enable ? .yellow : .red)
                    .offset(dragAmount)
                    .animation(
                        .default.delay(Double(num) / 20), value: dragAmount)
            }
        }
        .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation}
                        .onEnded { _ in dragAmount = .zero
                            enable.toggle()
                        }
                    )

        
        
//        LinearGradient(gradient: Gradient(colors: [.blue, .pink]), startPoint: .topLeading, endPoint: .bottomTrailing)
//            .frame(width: 300, height: 200)
//            .clipShape(RoundedRectangle(cornerRadius: 10))
//            .offset(dragAmount)
//            .gesture(
//            DragGesture()
//                .onChanged { dragAmount = $0.translation}
//                .onEnded { _ in dragAmount = .zero }
//            )
            
        
        
        
//        Button("Tap me") {
//            enable.toggle()
//        }
//        .frame(width: 200, height: 200)
//        .background(enable ? .blue : .red)
//        .foregroundColor(.white)
//        .animation(.default, value: enable)
        
//        Button("Tap me") {
//            withAnimation {
//            animationAmount += 360
//        }
//        }
//        .padding(50)
//        .background(.gray)
//        .foregroundColor(.white)
//        .clipShape(Circle())
//        .rotation3DEffect(.degrees(animationAmount), axis: (x: 90, y: 0, z: 0))
//
        
        
//        VStack {
//            Stepper("Scale amount", value: $animationAmount.animation(), in: 1...10)
//
//            Spacer()
//
//            Button("Tap me") {
//                      animationAmount += 1
//                  }
//                      .padding(50)
//                      .background(.gray)
//                      .foregroundColor(.white)
//                      .clipShape(Circle())
//                      .scaleEffect(animationAmount)
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portrait)
    }
}
