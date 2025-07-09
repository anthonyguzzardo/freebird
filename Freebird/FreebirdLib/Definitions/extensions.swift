import MapKit

//MARK: Enum Extensions

extension MeetUpCategory {
    var displayName: String {
        String(describing: self).replacingOccurrences(of: "_", with: " ")
    }
}

// MARK: MapKit extensions

