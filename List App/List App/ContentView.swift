//
//  ContentView.swift
//  List App
//
//  Created by swapnil.anil.andhale on 07/09/22.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    NavigationLink(destination: DetailView(restaurant: restaurant)) {
                        BasicImageView(restaurant: restaurant)
                        //FullImageView(restaurant: restaurant)
                    }
                }
            }
            .navigationBarTitle("Restaurants")
            
        }
        
        //        List(restaurants.indices) { index in
        //
        //            if (0...1).contains(index) {
        //                FullImageView(restaurant: self.restaurants[index])
        //            } else {
        //                BasicImageView(restaurant: self.restaurants[index])
        //            }
        //        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



struct BasicImageView: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            
            Text(restaurant.name)
        }
    }
}

struct FullImageView: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            
            Text(restaurant.name)
                .font(.system(.title ,design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}
