//
//  File.swift
//  
//
//  Created by Cristian Peña Barrios on 23/04/24.
//

import Foundation

public struct Character {

    public var profilePictureURL: URL
    public var username: String
    public var description: String
    
    public init(profilePictureURL: URL, username: String, description: String) {
        
        self.profilePictureURL = profilePictureURL
        self.username = username
        self.description = description
    }
}
