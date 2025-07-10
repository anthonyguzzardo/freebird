//
//  Destination.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/7/25.
//

import SwiftData
import MapKit

@Model
/// Large concetet area that groups together multiple Locations 
public class MeetUp {
    
    // MARK: Class Members
    public var name : String
    public var coordinate : Coordinate?
    public var latitudeDelta : Double?
    public var longitudeDelta : Double?
    
    @Relationship(deleteRule: .cascade)
    var mapMarks : [MapMark] = []
    
    // MARK: Constructor
    //SwiftData requires an init
    init(name: String, coordinate: Coordinate? = nil, latitudeDelta: Double? = nil,
         longitudeDelta : Double? = nil)
    {
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


extension MeetUp {
    static var preview : ModelContainer {
        let container = try! ModelContainer(
            for: MeetUp.self,
            configurations: ModelConfiguration(
                isStoredInMemoryOnly: true
            )
        )
        MainActor.assumeIsolated {
            let chicago = MeetUp(
                name: "Chicago",
                coordinate: Coordinate(41.9211,-87.6338),
                latitudeDelta: 0.2,
                longitudeDelta: 0.2
            )
            for mark in staticLocations {
                chicago.mapMarks.append(
                    MapMark(
                        name: mark.name,
                        coordinate: mark.coordinate,
                        address: mark.address,
                    )
                )
            }
            container.mainContext.insert(chicago)
            
        }
        return container
    }
}
