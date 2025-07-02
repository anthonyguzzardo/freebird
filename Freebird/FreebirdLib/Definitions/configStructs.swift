struct AppConfig : Decodable{
    
    struct MapConfig: Decodable {
        let width: String
        let height: String

        var widthInt: Int {
            return Int(width) ?? 0
        }

        var heightInt: Int {
            return Int(height) ?? 0
        }
    }

    struct ConnectionStrings : Decodable {
        let passcode    : String
        let apiBaseUrl  : String
    }

    let map                 :   MapConfig
    let connectionStrings   :   ConnectionStrings
}
