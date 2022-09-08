//
//  ContentView.swift
//  SwiftUIForm
//
//  Created by Swapnil on 7/9/2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var settingStore: SettingStore
    @State private var selectedRestaurant: Restaurant?
    @State private var showSettings: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(restaurants) { restaurant in
                    if self.shouldShowItem(restaurant: restaurant) {
                        BasicImageRow(restaurant: restaurant)
                            .contextMenu {
                                
                                Button(action: {
                                    // mark the selected restaurant as check-in
                                    self.checkIn(item: restaurant)
                                }) {
                                    HStack {
                                        Text("Check-in")
                                        Image(systemName: "checkmark.seal.fill")
                                    }
                                }
                                
                                Button(action: {
                                    // delete the selected restaurant
                                    self.delete(item: restaurant)
                                }) {
                                    HStack {
                                        Text("Delete")
                                        Image(systemName: "trash")
                                    }
                                }
                                
                                Button(action: {
                                    // mark the selected restaurant as favorite
                                    self.setFavorite(item: restaurant)
                                    
                                }) {
                                    HStack {
                                        Text("Favorite")
                                        Image(systemName: "star")
                                    }
                                }
                            }
                            .onTapGesture {
                                self.selectedRestaurant = restaurant
                            }
                    }
                }
                .onDelete { (indexSet) in
                    restaurants.remove(atOffsets: indexSet)
                }
            }
            
            .navigationBarTitle("Restaurant")
            .navigationBarItems(trailing:
                                    
                                    Button(action: {
                self.showSettings = true
            }, label: {
                Image(systemName: "gear").font(.title3)
                    .foregroundColor(.black)
            })
            )
            .sheet(isPresented: $showSettings) {
                SettingView().environmentObject(self.settingStore)
            }
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
    }
    
    private func delete(item restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants.remove(at: index)
        }
    }
    
    private func setFavorite(item restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants[index].isFavorite.toggle()
        }
    }
    
    private func checkIn(item restaurant: Restaurant) {
        if let index = restaurants.firstIndex(where: { $0.id == restaurant.id }) {
            restaurants[index].isCheckIn.toggle()
        }
    }
    
    private func shouldShowItem(restaurant: Restaurant) -> Bool {
        return (!self.settingStore.showCheckInOnly || restaurant.isCheckIn) && (restaurant.priceLevel <= self.settingStore.maxPriceLevel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(SettingStore())
    }
}



struct BasicImageRow: View {
    var restaurant: Restaurant
    
    var body: some View {
        
        HStack {
            Image(restaurant.image)
                .resizable()
                .frame(width: 60, height: 60)
                .clipShape(Circle())
                .padding(.trailing, 10)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(restaurant.name)
                        .font(.system(.body, design: .rounded))
                        .bold()
                    
                    Text(String(repeating: "$", count: restaurant.priceLevel))
                        .font(.subheadline)
                        .foregroundColor(.gray)
                    
                }
                
                Text(restaurant.type)
                    .font(.system(.subheadline, design: .rounded))
                    .bold()
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                
                Text(restaurant.phone)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.secondary)
            }
            
            Spacer()
                .layoutPriority(-100)
            
            if restaurant.isCheckIn {
                Image(systemName: "checkmark.seal.fill")
                    .foregroundColor(.red)
            }
            
            if restaurant.isFavorite {
                //                    Spacer()
                
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
            }
        }
        
        
    }
}

