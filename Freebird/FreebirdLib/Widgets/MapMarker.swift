//
//  MapMarker.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/2/25.
//
import MapKit
import SwiftUI

public class MapMarker{
    
    let bean = CLLocationCoordinate2D(
        latitude: 41.8826,
        longitude: -87.6226)
    
    func AddMapMarker( coordinates : Coordinates ) -> CLLocationCoordinate2D{
        let location = CLLocationCoordinate2D(latitude: coordinates.latitude, longitude: coordinates.longitude)
        return location
    }
    
}
