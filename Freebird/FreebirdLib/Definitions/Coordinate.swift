import CoreFoundation
import CoreLocation
import MapKit

/*
 
 Need 1 Map
 Need 2 Coordinate
 Need 1 Marker
 
 */

/// Semantic type, wrapping CLLocationCoordinate2D in own Coordinates
/// Params are latitude, longitude
public struct Coordinate: Codable, Equatable {
    public let latitude: Double
    public let longitude: Double

    public init(_ latitude: Double, _ longitude: Double) {
        self.latitude = latitude
        self.longitude = longitude
    }

    public var clCoordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
}
