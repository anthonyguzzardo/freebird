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

public struct MMMapView: View {
    
    // MARK: State Members
    @State private var isPlacingEvent: Bool = false
    @State private var visibleRegion: MKCoordinateRegion?
    @State private var cameraPosition: MapCameraPosition = .region(
        MKCoordinateRegion(
            center: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6338),
            span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
        )
    )
    // Chicago center coordinates
    private let chicagoRegion = MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6338), // Lincoln Park Zoo approx
        span: MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
    )

    
    
    // MARK: Body
    
    public var body: some View {
        ZStack {
            // TabView in the background
            TabView {
                // First tab
                Map(position : $cameraPosition) {
                    ForEach(staticLocations) { location in
                        // Use Annotation instead of Marker for more control
                        Annotation(
                            location.name,
                            coordinate: CLLocationCoordinate2D(
                                latitude: location.coordinate.latitude,
                                longitude: location.coordinate.longitude
                            )
                        ) {
                            Image(systemName: "mappin.circle.fill")
                                .resizable()
                                .frame(width: 28, height: 28)
                                .foregroundColor(.blue)
                                .shadow(radius: 2)
                        }
                    }
                }
                .onMapCameraChange(frequency : .onEnd) {context in
                    visibleRegion = context.region
                }
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }

            }
            //TODO: MapCircle... cool feature creates circle overlay
            // MapCircle
            // ActionBar pinned above the tab bar
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
    MMMapView()
}
