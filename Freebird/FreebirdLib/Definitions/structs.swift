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
public struct Coordinate { // Strongly Typed easier to
    private let _coordinate: CLLocationCoordinate2D

    public init(_ latitude: CLLocationDegrees, _ longitude: CLLocationDegrees) {
        self._coordinate = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }

    public var coordinate: CLLocationCoordinate2D {
        _coordinate
    }
    
    public var latitude: CLLocationDegrees {
        _coordinate.latitude
    }

    public var longitude: CLLocationDegrees {
        _coordinate.longitude
    }

}
