//
//  Profile.swift
//  DraftSport
//
//  Created by Hugh Jeremy on 29/2/20.
//

import Foundation


struct Profile: Decodable {
    
    let firstName: String
    let lastName: String
    let positionName: String
    let publicId: String
    let teamName: String

    private enum Keys: String, CodingKey {
        case publicId = "public_id"
        case firstName = "first_name"
        case lastName = "last_name"
        case positionName = "position_name"
        case teamName = "team_name"
    }
    
}
