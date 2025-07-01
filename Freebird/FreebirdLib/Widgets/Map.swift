// MAP ONLY GETS CREATED ONCE
public static class Map {

    // MARK: - Private Members
    private var dimensions: Dimensions
    public private(set) var events: [Event] = []

    // MARK: - Singleton Instance
    public static let shared: Map = {
        do {
            let defaultDims = Dimensions(width: ConfigSettings.mapWidth, height: ConfigSettings.mapHeight)
            return try Map(dimensions: defaultDims)
        } catch {
            fatalError("Failed to initialize Map: \(error)")
        }
    }()
    
    // MARK: - Constructors
    public convenience init(_ dimensions: Dimensions) throws {
        try self.init(dimensions: dimensions)
    }

    private init(dimensions: Dimensions) throws {
        guard dimensions.width >= 0, dimensions.height >= 0 else {
            throw MapError.invalidDimensions
        }
        self.dimensions = dimensions
    }

    public func addEvent(event : Event){
        if event.contains(where: { $0 == event}){
            throw SimpleError(message: "Event already exists")
        }
        events.append(event)
    }

    public func removeEvent(event : Event){
        guard let index = events.firstIndex(where : {$0 == evnet}) else{
            throw SimpleError(message: "Event does not exist")
        }
        events.remove(at: index)
    }


    // MARK: - Properties
    public private(set) var events: [Event] = []


}