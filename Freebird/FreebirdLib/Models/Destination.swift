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
    public var placeMarks : [MMMapMarker]
    
    // MARK: Constructor
    //SwiftData requires an init
    init(name: String, placemarks : [MMMapMarker],
         coordinate: Coordinate? = nil, latitudeDelta: Double? = nil,
         longitudeDelta : Double? = nil)
    {
        self.name = name
        self.coordinate = coordinate
        self.latitudeDelta = latitudeDelta
        self.longitudeDelta = longitudeDelta
        self.placeMarks = placemarks
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

extension Destination {
    static var preview : ModelContainer {
        let container = try! ModelContainer(
            for: Destination.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
        ))
        // Insert on MainActor
        MainActor.assumeIsolated {
            for location in staticLocations {
                let destination = Destination(
                    name: location.name,
                    placemarks: [MMMapMarker](),
                    coordinate: Coordinate(
                        location.coordinate.latitude,
                        location.coordinate.longitude
                    ),
                    latitudeDelta: location.latitudeDelta,
                    longitudeDelta: location.longitudeDelta
                )
                container.mainContext.insert(destination)
            }
        }
        return container
    }
}
