import MapKit

//MARK: Enum Extensions

extension MeetCategory {
    var displayName: String {
        String(describing: self).replacingOccurrences(of: "_", with: " ")
    }
}

// MARK: MapKit extensions

