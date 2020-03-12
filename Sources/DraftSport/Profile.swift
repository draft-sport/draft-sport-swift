//
//  Profile.swift
//  DraftSport
//
//  Created by Hugh Jeremy on 29/2/20.
//

import Foundation


public struct Profile: Decodable {
    
    let firstName: String
    let lastName: String
    let positionName: String
    let publicId: String
    let teamName: String
    
    var displayName: String { return self.firstName + " " + self.lastName }

    public init(
        firstName: String,
        lastName: String,
        positionName: String,
        publicId: String,
        teamName: String
    ) {
        
        self.firstName = firstName
        self.lastName = lastName
        self.positionName = positionName
        self.publicId = publicId
        self.teamName = teamName
        
        return
        
    }
    
    public init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: Keys.self)
        self.publicId = try data.decode(String.self, forKey: .publicId)
        self.lastName = try data.decode(String.self, forKey: .lastName)
        self.firstName = try data.decode(String.self, forKey: .firstName)
        self.positionName = try data.decode(String.self, forKey: .positionName)
        self.teamName = try data.decode(String.self, forKey: .teamName)
    }

    private enum Keys: String, CodingKey {
        case publicId = "public_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case positionName = "position_name"
        case teamName = "team_name"
    }
    
}
