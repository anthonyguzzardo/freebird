//
//  Destination.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/7/25.
//

import SwiftData
import MapKit

@Model
public class Destination {
    
    // MARK: Class Members
    public var name : String
    public var coordinate : Coordinate?
    public var latitudeDelta : Double?
    public var longitudeDelta : Double?
    
    @Relationship(deleteRule: .cascade)
    public var placemarks : [MMMapMarker]
    
    // MARK: Constructor
    //SwiftData requires an init
    init(name: String, coordinate: Coordinate? = nil, latitudeDelta: Double? = nil, longitudeDelta: Double? = nil) {
        self.name = name
        self.coordinate = coordinate
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
    }
    
    var region : MKCoordinateRegion? {
        if let coordinate, let latitudeDelta, let longitudeDelta{
            return MKCoordinateRegion(
                center: CLLocationCoordinate2D(latitude: coordinate.latitude, longitude: coordinate.longitude),
                span: MKCoordinateSpan(latitudeDelta: latitudeDelta, longitudeDelta: longitudeDelta))
        } else {
            return nil
        }
    }
}
