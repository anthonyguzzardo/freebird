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
import SQLite3

public struct MeetMap: View {
    // MARK: Properties
    var meetUp      : MeetUp // this is basically a paramater to the struct
    
    // MARK: Struct Members
    @Environment(\.modelContext) private var modelContext
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
            MapReader { proxy in
                Map(position : $cameraPosition)
                {
                    
                }
                //TODO: Figure out how to get the coordinates to change everytime
                .onTapGesture { position in
                    if let coordinate = proxy.convert(position, from: .local){
                        print(coordinate)
                        let mapMark = MapMark(
                            name: "",
                            coordinate: Coordinate(
                                coordinate.latitude,
                                coordinate.longitude),
                            address: ""
                        )
                        modelContext.insert(mapMark)
                    }
                    
    //                if let coordinate = proxy.convert(position, from: .local){
    //                    let mapMark = MapMark(
    //                        name : "", coordinate: coordinate, address: "")
    //
    //                }
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
                .ignoresSafeArea()
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
            }

            
            
            if showInfoCard, let region = tappedRegion{
                MeetUpCardOverlay(region: region)
            }
            
            VStack {
                Spacer()
                ActionBar(isPlacingEvent: $isPlacingEvent)
                    .padding(.bottom, 40)
            }
            //TODO: this is blocking the compass that apppears when you two finger rotate screen...
            .safeAreaInset(edge: .top) {
                DateWheel()
            }

        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
        .toolbarBackground(.visible, for: .tabBar)
        .toolbarColorScheme(.dark, for: .tabBar)
    }

}

#Preview {
    let container = MeetUp.preview
    let fetchDescriptor = FetchDescriptor<MeetUp>()
    let meetUp = try! container.mainContext.fetch(fetchDescriptor)[0]
    return MeetUpMap(meetUp: meetUp)
        .modelContainer(container)
}
