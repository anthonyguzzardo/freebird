//
//  MapMarker.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/3/25.
import MapKit
import CoreLocation
import SwiftUI

public struct MapMarker: View {
    let event : Event
    public init(event : Event){
        self.event = event
    }
    
    public var body : some View {
        Map(){
            Marker(event.title, coordinate : CLLocationCoordinate2D(
                latitude : event.coordinate.latitude,
                longitude: event.coordinate.longitude))
        }
    }
}
