// CGFloat means core graphics float and is the data tyep used thorugh iOs/macOS
// needs to be CGFloat...class that determines when a double or float is needed across devices
struct Dimensions {
    let width  : Double // CGFloat
    let height : Double // CGFloat
    let depth  : Double // CGFloat
}

struct Coordinates {
    let longitude : Double // CGFloat
    let latitude  : Double  
}

struct MapPin{
    let location : Coordinates // (41.9141994, –87.6244975 )
    let title    : String   // North Ave Beach 
}

struct MapDimensions{
    public static var width: Int{
        return ConfigSettings.mapWidth
    }
    public static var height: Int{
        return ConfigSettings.mapHeight
    }
}