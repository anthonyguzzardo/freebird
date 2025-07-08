// StaticLocations.swift
// Freebird
//
// Created by Anthony Guzzardo on 7/7/25.
//

import Foundation
import CoreLocation

// 10 Static Locations
public let staticLocations: [MapMark] = [

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9484, -87.6553),
        address: "1601 W Addison St, Chicago, IL 60613",
        name: "Wrigley Field"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9400, -87.6367),
        address: "Belmont Harbor, Chicago, IL",
        name: "Belmont Harbor"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9495, -87.6636),
        address: "3733 N Southport Ave, Chicago, IL 60613",
        name: "Music Box Theatre"
    ),

    // Lincoln Park
    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9211, -87.6338),
        address: "2001 N Clark St, Chicago, IL 60614",
        name: "Lincoln Park Zoo"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9105, -87.6315),
        address: "1600 N Lake Shore Dr, Chicago, IL 60610",
        name: "North Avenue Beach"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9266, -87.6387),
        address: "2430 N Cannon Dr, Chicago, IL 60614",
        name: "Peggy Notebaert Nature Museum"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9214, -87.6351),
        address: "2391 N Stockton Dr, Chicago, IL 60614",
        name: "Lincoln Park Conservatory"
    ),

    // Old Town
    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9109, -87.6355),
        address: "1616 N Wells St, Chicago, IL 60614",
        name: "Second City"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9105, -87.6385),
        address: "219 W North Ave, Chicago, IL 60610",
        name: "Old Town Ale House"
    ),

    MapMark(
        id: UUID().uuidString,
        coordinate: Coordinate(41.9114, -87.6399),
        address: "1633 N Cleveland Ave, Chicago, IL 60614",
        name: "St. Michael's Church"
    )
]
