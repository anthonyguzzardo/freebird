//
//  MapMarker.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/3/25.
import MapKit
import CoreLocation
import SwiftUI

///MapMarker abstracts away iterating through the events list on the Main contentview
///This works because we place return MapMarker as MapContent
public struct MapMarker: MapContent {
    let events : [Event]
    public init(_ events : [Event]){
        self.events = events
    }
    
    ///
    public var body : some MapContent {
        ForEach(events){event in
            Marker(
                event.title,
                coordinate : CLLocationCoordinate2D(latitude : event.coordinate.latitude,
                                                       longitude: event.coordinate.longitude))
        }
    }
}
