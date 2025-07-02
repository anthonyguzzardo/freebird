import CoreFoundation

struct Dimensions {
    let width  : CGFloat // CGFloat
    let height : CGFloat // CGFloat
    let depth  : CGFloat // CGFloat
}

struct Coordinates {
    let longitude : CGFloat // CGFloat
    let latitude  : CGFloat
}

public struct MapPin{
    let location : Coordinates // (41.9141994, –87.6244975 )
    let title    : String   // North Ave Beach 
}

//struct MapDimensions{
//    public static var width: Int{
//        return ConfigSettings.mapWidth
//    }
//    public static var height: Int{
//        return ConfigSettings.mapHeight
//    }
//}
