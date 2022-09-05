//
//  ContentView.swift
//  MapKit with SwiftUI
//
//  Created by Swapnil on 05/09/22.
//

import MapKit
import SwiftUI

struct Location: Identifiable {
    let id = UUID()
    let name: String
    let coordinate: CLLocationCoordinate2D
}

struct ContentView: View {
    @State private var mapRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 18.53, longitude: 73.85), span: MKCoordinateSpan(latitudeDelta: 0.2, longitudeDelta: 0.2))
    
    let location = [
        Location(name: "Baner", coordinate: CLLocationCoordinate2D(latitude: 18.55, longitude: 73.77)),
        Location(name: "Hadapsar", coordinate: CLLocationCoordinate2D(latitude: 18.49, longitude: 73.94))
    ]
    
    var body: some View {
        NavigationView {
            Map(coordinateRegion: $mapRegion, annotationItems: location) { location in
                MapAnnotation(coordinate: location.coordinate) {
                    NavigationLink {
                        Text(location.name)
                    } label: {
                        Circle()
                            .stroke(.red, lineWidth: 3)
                            .frame(width: 44, height: 44)
                    }
                }
            }
            .navigationTitle("Location Explorer")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
