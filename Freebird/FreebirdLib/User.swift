import Foundation
/// base class for users
public class User{
    public var uid : String = UUID().uuidString
    public var name: String
    public init(name : String){
        self.name = name
    }
}//
//  User.swift
//  Freebird
//
//  Created by Anthony Guzzardo on 7/3/25.
//

