//MARK: Enum Extensions

extension EventCategory {
    func toString() -> String {
        let rawString = String(describing: self)
        if rawString.contains("_") {
            let newString = rawString.replacingOccurrences(of: "_", with: " ")
            return newString
        } else {
            return rawString
        }
    }
}
