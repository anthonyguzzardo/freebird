public protocol Widget: AnyObject {

    // MARK: - Properties
    var title       : String?                   { get set }
    var position    : (x: Int, y: Int)          { get set }
    var size        : (width: Int, height: Int) { get set }
    
    
    // MARK: - Utlities
    fund render()
    fund debugDescription() -> String

}