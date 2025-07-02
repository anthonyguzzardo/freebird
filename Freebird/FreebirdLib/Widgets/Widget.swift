public protocol Widget: AnyObject {
    // MARK: - Utlities
    func render()
    func debugDescription() -> String

}
