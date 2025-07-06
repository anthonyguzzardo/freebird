//
//  ContentView.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/1/25.
//
import CoreLocation
import MapKit
import SwiftUI
import SwiftData
import Foundation

struct FreebirdMap: View {
    
    @Environment(LocationManager.self) var locationManager
    @State private var cameraPosition : MapCameraPosition = .userLocation(fallback: .automatic)
    let tennis: Event
    let northAve: Event
    let events : [Event]
    init() {
            let wavelandCourtsCoordinates = Coordinate(41.9220, -87.6290)
            let northAveCoords = Coordinate(41.9189, -87.6254)

            tennis = Event(
                title: "tennis",
                date: Date(),
                coordinate: wavelandCourtsCoordinates,
                eventCategory: .sport
            )

            northAve = Event(
                title: "beach",
                date: Date(),
                coordinate: northAveCoords,
                eventCategory: .social
            )
        events = [tennis, northAve]
    }
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // The full-screen map in the background
            Map(position: $cameraPosition) {
                UserAnnotation()
                ForEach(events) { event in
                    Marker(
                        event.title,
                        coordinate: CLLocationCoordinate2D(
                            latitude: event.coordinate.latitude,
                            longitude: event.coordinate.longitude
                        )
                    )
                }
            }
            .onAppear{
                updateCAmeraPosition()
            }
            .mapControls {
                MapUserLocationButton()
            }
            // Your action bar overlaid on top of the map
            ActionBar()
                .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.all) // Make sure map goes edge-to-edge
    }
    
    func updateCAmeraPosition(){
        if let userLocation = locationManager.userLocation {
            let userRegion = MKCoordinateRegion(
                center: userLocation.coordinate,
                span  : MKCoordinateSpan(
                    latitudeDelta : 0.15,
                    longitudeDelta: 0.15
                )
            )
            withAnimation{
                cameraPosition = .region(userRegion)
            }
        }
    }
}

///Location Delegate Function

#Preview {
    FreebirdMap()
        .environment(LocationManager())
}

