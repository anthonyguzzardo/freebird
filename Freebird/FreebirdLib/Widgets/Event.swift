//import CoreLocation
//public class Event: Widget {
//
//    // MARK: - Public Members
//    public var mapPin: MapPin               // Struct contains location and coordinates(longitude,latitude)
//    public var eventCategory: EventCategory // ENUM
//
//    // MARK: - Constructors
//    public convenience init(_ mapPin: MapPin, _ eventCategory: EventCategory) {
//        self.init(rawMapPin: mapPin, rawEventCategory: eventCategory)
//    }
//
//    public init(rawMapPin: MapPin, rawEventCategory: EventCategory) {
//        self.mapPin = rawMapPin
//        self.eventCategory = rawEventCategory
//    }
//    
//    
//    // MARK: Utilities
//    public func render() -> Void {
//        print("banana")
//    }
//    public func debugDescription() -> String {
//        return "banana"
//    }
//    
//
//    public func generateRandomCoordinates() -> Coordinates {
//        Coordinates(
//            longitude: CLLocationDegrees(Double.random(in: 0...180)),
//            latitude: CLLocationDegrees(Double.random(in: 0...90))
//        )
//    }
//
//}
