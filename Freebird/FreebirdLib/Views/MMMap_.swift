////
////  ContentView.swift
////  Freebird
////
////  Created by Anthony Guzzardo on 7/1/25.
////
//import CoreLocation
//import MapKit
//import SwiftUI
//import SwiftData
//import Foundation
//
//struct MMMap_: View {
//    let chicagoCoordinate = Coordinate(41.9028, -87.6232)
//    
//    @EnvironmentObject var locationManager: LocationManager
//    @EnvironmentObject var mapEventStore  : MapEventStore
//
//    @State private var isPlacingEvent: Bool = false
//    @State private var cameraPosition: MapCameraPosition = .region(
//        MKCoordinateRegion(
//            center: CLLocationCoordinate2D(latitude: 41.8781, longitude: -87.6298), // Chicago fallback
//            span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//        )
//    )
//    
//    let tennis: Event
//    let northAve: Event
//    let events: [Event]
//
//    // In Swift, all stored properties of the struct must be initialized here to satisfy the compiler
//    // before the View body can access them.
//    init() {
//        let wavelandCourtsCoordinates = Coordinate(41.9220, -87.6290)
//        let northAveCoords = Coordinate(41.9189, -87.6254)
//
//        tennis = Event_(
//            title: "tennis",
//            date: Date(),
//            coordinate: wavelandCourtsCoordinates,
//            eventCategory: .Sport
//        )
//
//        northAve = Event_(
//            title: "beach",
//            date: Date(),
//            coordinate: northAveCoords,
//            eventCategory: .Social
//        )
//
//        events = [tennis, northAve]
//    }
//
//    var body: some View {
//        ZStack(alignment: .bottom) {
//            Map(position: $cameraPosition) {
//                UserAnnotation()
//                MapMarker(events)
//            }
//            .mapControls {
//                MapUserLocationButton()
//            }
//            .onReceive(locationManager.$userLocation) { location in
//                guard let location = location else { return }
//                let region = MKCoordinateRegion(
//                    center: location.coordinate,
//                    span: MKCoordinateSpan(latitudeDelta: 0.1, longitudeDelta: 0.1)
//                )
//                withAnimation {
//                    cameraPosition = .region(region)
//                }
//            }
//
//            ActionBar(isPlacingEvent: $isPlacingEvent)
//                .padding(.bottom, 20)
//        }
//        .edgesIgnoringSafeArea(.all)
//    }
//}
