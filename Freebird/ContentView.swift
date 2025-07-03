//
//  ContentView.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//
import CoreLocation
import MapKit
import SwiftUI

struct ContentView: View {
    @State private var region = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // Chicago
        span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
    )
    
    let wrigleyCoordinates = Coordinate(41.9484, -87.6553)

    let user = User(name: "anthony")
    var sport = EventCategory.sport
    
    var tennis: Event {
        Event(
            title: "tennis",
            date: Date(),
            coordinate: wrigleyCoordinates,
            eventCategory: sport
        )
    }
    
    var body: some View {
        let marker = Marker("Wrgiley", coordinate : wrigleyCoordinates.coordinate)
        Map(){
            marker
        }
    }
}

#Preview {
    ContentView()
}
