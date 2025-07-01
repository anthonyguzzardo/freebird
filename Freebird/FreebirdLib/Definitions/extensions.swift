public class Extensions{
    // MARK: - String Extensions
    extension String {
        func toInt(_ name: String) -> Int {
            guard let intVal = Int(self) else {
                fatalError("\(name) is not a valid integer: '\(self)'")
            }
            return intVal
        }
    }
}

