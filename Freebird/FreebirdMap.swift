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

struct FreebirdMap: View {
    
    let manager = CLLocationManager()
    @State private var cameraPosition : MapCameraPosition = .userLocation(fallback: .automatic)
    
    var body: some View {
        ZStack(alignment: .bottom) {
            // The full-screen map in the background
            Map(position: $cameraPosition) {
                UserAnnotation()
            }
            .mapControls {
                MapUserLocationButton()
            }
            .onAppear {
                manager.requestWhenInUseAuthorization()
            }
            
            // Your action bar overlaid on top of the map
            ActionBar()
                .padding(.bottom, 20)
        }
        .edgesIgnoringSafeArea(.all) // Make sure map goes edge-to-edge
    }
}

///Location Delegate Function

#Preview {
    FreebirdMap()
}

