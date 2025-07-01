import Definitions

public class Event: BaseWidget {

    // MARK : - Public Members

    private public(set) var mapPin  :  MapPin
    private public(set) var name    :  KnownEvent

    // MARK: - Constructors
    public convenience init(name: String, pin: MapPin) throws {
        try self.init(validatedName: name, mapPin: pin)
    }

    private init(validatedName name: String, mapPin: MapPin) throws {
        guard let parsed = name.ToEventType() else {
            throw SimpleError(message: "\(name) is not an accepted Event.")
        }
        self.name = parsed
        self.mapPin = mapPin
        super.init(title: name) // assuming you want to set this as the widget title
    }

}
