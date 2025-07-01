public class BaseWidget : Widget{

    // MARK: - Public Members    
    public private(set) var title    : String?
    public private(set) var position : (x: Int, y:Int)
    public private(set) var size     : (width: Int, height: Int)


    // MARK: - Constructors
    public convenience init(title: String? = nil, position: (x: Int, y: Int) = (0,0),
        size: (width: Int, height: Int) = (100,100))
    {
        self.init(title, position, size)
    }

    private init(title: String? = nil, position: (x: Int, y: Int) = (0,0),
        size: (width: Int, height: Int) = (100,100))
    {
        self.title      = title
        self.position   = position
        self.size       = size
    }

    // MARK: - Utilities
    public func render() -> Void {
        print("Rendering widget: \(title ?? "")")
    }

    public func debugDescription() -> String {
        return "Widget \(title ?? "") [\(position.x), \(position.y)] \(size.width)x\(size.height)"
    }

}