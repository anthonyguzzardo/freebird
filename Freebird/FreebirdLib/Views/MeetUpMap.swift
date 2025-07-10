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

public struct MeetUpMap: View {
    // MARK: Properties
    var meetUp      : MeetUp // this is basically a paramater to the struct
    
    // MARK: Struct Members
    @State private var cameraPosition : MapCameraPosition = .region( MKCoordinateRegion(
        center: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6338), // Lincoln Park Zoo approx
        span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)))
    @State private var isPlacingEvent   : Bool = false
    @State private var visibleRegion    : MKCoordinateRegion?
    
    @State private var showInfoCard = false
    @State private var tappedRegion: MKCoordinateRegion?

    
    
    // MARK: Body
    
    public var body: some View {
        ZStack {
            Map(position : $cameraPosition)
            {
                // RIGHT HERE I WANT TO ADD THE .onTapGesture no????

                //TODO: Uncomment if you wnat to see preview of events
//                ForEach(meetUp.mapMarks){mark in
//                    Marker(coordinate: mark.coordinate.cl){
//                        Label(mark.name, systemImage: "pin")
//                    }
//
//                }
            }
            //TODO: Figure out how to get the coordinates to change everytime
            .onTapGesture {
                if showInfoCard {
                    // Hide if already visible
                    showInfoCard = false
                } else if let region = visibleRegion {
                    // Show if currently hidden
                    tappedRegion = region
                    showInfoCard = true
                    
                    // Optionally move camera
                    cameraPosition = .region(
                        MKCoordinateRegion(
                            center: region.center,
                            span: MKCoordinateSpan(latitudeDelta: 0.15, longitudeDelta: 0.15)
                        )
                    )
                }
            }

            .onMapCameraChange(frequency : .onEnd) {context in
                visibleRegion = context.region
            }
            .onAppear{
                if let region = meetUp.region {
                    cameraPosition = .region(region)
                }
            }
            .tabItem {
                Image(systemName: "map")
                Text("Map")
            }
            if showInfoCard, let region = tappedRegion{
                meetUpCardOverlay(region: region)
            }
            
            
            VStack {
                Spacer()
                ActionBar(isPlacingEvent: $isPlacingEvent)
                    .padding(.bottom, 40)
            }
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }
    
}

private struct meetUpCardOverlay: View {
    let region: MKCoordinateRegion

    var body: some View {
        VStack(spacing: 0) {
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 32))
                .foregroundColor(.red)
                .padding(.bottom, 4)

            VStack(spacing: 8) {
                Text("Selected Region")
                    .font(.headline)
                    .bold()

                VStack(alignment: .leading, spacing: 4) {
                    Text("Latitude: \(region.center.latitude)")
                        .font(.headline)
                        .bold()
                    Text("Longitude: \(region.center.longitude)")
                        .font(.headline)
                        .bold()
                }
                .foregroundColor(.secondary)

                Button("Add MeetUp") {
                    // Action here
                }
            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 8)
            )
            .background(
                Circle()
                    .fill(Color(.systemBackground).opacity(0.3))
            )
        }
        .padding(.bottom, 60)
    }
}


#Preview {
    let container = MeetUp.preview
    let fetchDescriptor = FetchDescriptor<MeetUp>()
    let meetUp = try! container.mainContext.fetch(fetchDescriptor)[0]
    return MeetUpMap(meetUp: meetUp)
        .modelContainer(container)
}
