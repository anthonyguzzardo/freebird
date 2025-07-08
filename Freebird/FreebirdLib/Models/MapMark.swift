//
//  FreebirdMapMarker.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/7/25.
//

import SwiftData
import MapKit



/// Mark on a map inside a broader 'Event' i.e. Landmark or Pin
/// Need Coordinates(latitude, longitude) , address, name, and option Destination object
@Model
public class MapMark{
    public var id           : String
    public var coordinate   : Coordinate
    public var address      : String
    public var name         : String
    public var event        : MeetUp?

    public init(id: String, coordinate: Coordinate, address: String, name: String) {
        self.id = id
        self.coordinate = coordinate
        self.address = address
        self.name = name
    }
    
}


