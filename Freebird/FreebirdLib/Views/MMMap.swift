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

public struct MMMap: View {
    
    // MARK: Struct Members
    @State private var cameraPosition : MapCameraPosition = .region( MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6338), // Lincoln Park Zoo approx
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)))
    @State private var isPlacingEvent   : Bool = false
    @State private var visibleRegion    : MKCoordinateRegion?
    @Query private var events     : [Event]
    @State private var event      : Event? //


    // MARK: Body
    public var body: some View {
        ZStack {
            Map(position : $cameraPosition) {
                if let event{
                    ForEach(event.mapMarks){mark in
                        Marker(coordinate: mark.coordinate.cl){
                            Label(mark.name, systemImage: "pin")
                        }
                        
                    }
                }
            }
            .onMapCameraChange(frequency : .onEnd) {context in
                visibleRegion = context.region
            }
            .onAppear{
                event = events.first
                if let region = event?.region {
                    cameraPosition = .region(region)
                }
            }
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }

            
            VStack {
                Spacer()
                ActionBar(isPlacingEvent: $isPlacingEvent)
                    .padding(.bottom, 60)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }
}

#Preview {
    MMMap()
        .modelContainer(Event.preview)
}
