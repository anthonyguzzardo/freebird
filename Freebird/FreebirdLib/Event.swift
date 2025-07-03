import Foundation // needed for Date and UUID

public class Event {
    private var _uid: String = UUID().uuidString
    private var _title: String = ""
    private var _description: String = ""
    private var _date: Date = Date()
    private var _coordinate: Coordinate
    private var _attendees: [User] = []
    private var _eventCategory : EventCategory = EventCategory.NULL_VALUE
    
    // The init no longer requires description
    public init(title: String, date: Date,coordinate: Coordinate,
                eventCategory : EventCategory = .NULL_VALUE,description: String = "")
    {
        guard eventCategory != .NULL_VALUE else {
            fatalError("eventCategory cannot be NULL_VALUE")
        }
        
        self._title = title
        self._date = date
        self._description = description // uses default if none provided
        self._coordinate = coordinate
        
    }
    
    public func removeAttendee(_ user: User) {
        _attendees.removeAll { $0.uid == user.uid }
    }
    
    public func addAttendee(_ user: User) {
        _attendees.append(user)
    }
    
    // MARK: Properties
    public var attendeeCount: Int {
        return _attendees.count
    }
    
    public var title: String {
        get {
            return self._title
        }
        set {
            self._title = newValue
        }
    }
}
