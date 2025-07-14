// MARK: - Accepted Event Categories
public enum MeetCategory: Int, CaseIterable {
    case NULL_VALUE = 0
    case Social
    case Party
    case Festive
    case Sport
    case Food
    case Theater
    case Music
    case School
    case Work
    case Fitness
    case Wellness
    case Nature
    case Gaming
    case Arts_Culture
    case Volunteer
    case Educational
    case Family_Friendly
    case Water_Activities
    case Outdoors
    case Other
    
}

//MARK: Exception/ Error handling

enum DatabaseError: Error {
    case insertionFailed(String)
    case deletionFailed(String)
    case modifyFailed(String)
    case viewFailed(String)
    case parameterMismatch(String)
}
