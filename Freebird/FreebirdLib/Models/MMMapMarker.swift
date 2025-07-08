//
//  FreebirdMapMarker.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/7/25.
//

import SwiftData
import MapKit

@Model
public class MMMapMarker {
    public var id: String
    public var coordinate: Coordinate
    public var address: String
    public var title: String
    public var destination: Destination?

    init(id: String, coordinate: Coordinate, address: String, title: String) {
        self.id = id
        self.coordinate = coordinate
        self.address = address
        self.title = title
    }
}


