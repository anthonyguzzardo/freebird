// StaticLocations.swift
// Freebird
//
// Created by Anthony Guzzardo on 7/7/25.
//

import Foundation
import CoreLocation

public struct Location: Identifiable {
    public let id = UUID()
    public let name: String
    public let description: String
    public let coordinate: CLLocationCoordinate2D
}

// 10 Static Locations

public let staticLocations: [Location] = [

    // Lakeview
    Location(
        name: "Wrigley Field",
        description: "Home of the Chicago Cubs.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9484, longitude: -87.6553)
    ),
    Location(
        name: "Belmont Harbor",
        description: "Marina and park area on Lake Michigan.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9400, longitude: -87.6367)
    ),
    Location(
        name: "Music Box Theatre",
        description: "Historic cinema with indie and classic films.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9495, longitude: -87.6636)
    ),

    // Lincoln Park
    Location(
        name: "Lincoln Park Zoo",
        description: "Free zoo with diverse animals.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9211, longitude: -87.6338)
    ),
    Location(
        name: "North Avenue Beach",
        description: "Popular beach with skyline views.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9105, longitude: -87.6315)
    ),
    Location(
        name: "Peggy Notebaert Nature Museum",
        description: "Natural history and butterfly haven.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9266, longitude: -87.6387)
    ),
    Location(
        name: "Lincoln Park Conservatory",
        description: "Victorian glasshouse with tropical plants.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9214, longitude: -87.6351)
    ),

    // Old Town
    Location(
        name: "Second City",
        description: "World-famous improv comedy theater.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9109, longitude: -87.6355)
    ),
    Location(
        name: "Old Town Ale House",
        description: "Classic dive bar with eclectic decor.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9105, longitude: -87.6385)
    ),
    Location(
        name: "St. Michael's Church",
        description: "Historic church dating to the 1850s.",
        coordinate: CLLocationCoordinate2D(latitude: 41.9114, longitude: -87.6399)
    )
]
