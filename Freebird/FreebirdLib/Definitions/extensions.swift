import MapKit


//MARK: Enum Extensions

extension EventCategory {
    var displayName: String {
        String(describing: self).replacingOccurrences(of: "_", with: " ")
    }
}

// MARK: MapKit extensions

