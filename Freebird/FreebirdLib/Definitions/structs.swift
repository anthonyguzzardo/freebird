import CoreFoundation
import CoreLocation

public struct Dimensions {
    let width  : CGFloat // CGFloat
    let height : CGFloat // CGFloat
    let depth  : CGFloat // CGFloat
}

public struct Coordinates {
    let longitude : CLLocationDegrees // CGFloat
    let latitude  : CLLocationDegrees
}

func toCLCoord(_ coords: Coordinates) -> CLLocationCoordinate2D {
    CLLocationCoordinate2D(latitude: coords.latitude, longitude: coords.longitude)
}

struct MapPin: Identifiable {
    let id = UUID()
    let title: String
    let coordinate: CLLocationCoordinate2D
}

//struct MapDimensions{
//    public static var width: Int{
//        return ConfigSettings.mapWidth
//    }
//    public static var height: Int{
//        return ConfigSettings.mapHeight
//    }
//}
