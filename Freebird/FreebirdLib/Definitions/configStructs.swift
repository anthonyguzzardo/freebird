struct AppConfig : Decodable{
    
    struct MapConfig: Decodable {
        let width: String
        let height: String

        var widthInt: Int {
            return width.toInt("Map Width")
        }

        var heightInt: Int {
            return height.toInt("Map Height")
        }
    }

    struct ConnectionStrings : Decodable {
        let passcode    : String
        let apiBaseUrl  : String
    }

    let map                 :   MapConfig
    let connectionStrings   :   ConnectionStrings
}