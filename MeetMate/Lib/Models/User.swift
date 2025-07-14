import Foundation
/// base class for users
public class User{
    private let _uid : String = UUID().uuidString
    private let _name: String
    
    public init(name : String){
        self._name = name
    }
    
    public var id : String{
        get {
            return self._uid
        }
    }
    public var name : String{
        get {
            return self._name
        }
    }

    
    
}

