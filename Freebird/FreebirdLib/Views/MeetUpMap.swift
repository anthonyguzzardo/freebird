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
                MeetUpCardOverlay(region: region)
            }
            
            VStack {
                Spacer()
                ActionBar(isPlacingEvent: $isPlacingEvent)
                    .padding(.bottom, 40)
            }
            .safeAreaInset(edge: .top) {
                DateWheel()
            }

        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }
    
}

private struct MeetUpCardOverlay: View {
    let region: MKCoordinateRegion

    var body: some View {
        ZStack {
            // The card itself
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

                Button(action: {
                    // Action here
                }) {
                    Text("Add MeetUp")
                        .foregroundColor(.white)
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                        .background(
                            RoundedRectangle(cornerRadius: 8)
                                .fill(Color.accentColor)
                        )
                }

            }
            .padding()
            .background(
                RoundedRectangle(cornerRadius: 16)
                    .fill(Color(.systemBackground))
                    .shadow(radius: 8)
            )
            .padding(.top, 32) // make space at the top for the circle

            // The floating icon in front
            ZStack {
                Circle()
                    .fill(Color.white)
                    .frame(width: 60, height: 60)
                    .shadow(radius: 4)

                Image("MeetMateIconPng")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 60, height: 60)
            }
            .offset(y: -68) // pull it up to sit over the cardbs
            Image(systemName: "mappin.circle.fill")
                .font(.system(size: 40))
                .foregroundColor(.black)
                .offset(y: 90)
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
