//
//  DetailView.swift
//  List App
//
//  Created by swapnil.anil.andhale on 07/09/22.
//

import SwiftUI

struct DetailView: View {
    var restaurant: Restaurant
    var body: some View {
        VStack {
            Image(restaurant.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            
            Spacer()
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(restaurant: Restaurant(name: "Cafe Deadend", image: "cafedeadend"))
    }
}
