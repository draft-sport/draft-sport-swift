//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


class Invitation: Decodable {
    
    //let created: DraftSportDate
    let leagueName: String
    let leagueId: String
    let token: String
    let inviteeId: String?
    let accepted: Bool
    let associatedEmail: String?
    
    required init(from decoder: Decoder) throws {

        let data = try decoder.container(keyedBy: Keys.self)
        //self.created = try data.decode(DraftSportDate.Self, forKey: .created)
        self.leagueName = try data.decode(String.self, forKey: .leagueName)
        self.leagueId = try data.decode(String.self, forKey: .leagueId)
        self.token = try data.decode(String.self, forKey: .token)
        self.inviteeId = try data.decodeIfPresent(
            String.self,
            forKey: .inviteeId
        )
        self.accepted = try data.decode(Bool.self, forKey: .accepted)
        self.associatedEmail = try data.decodeIfPresent(
            String.self,
            forKey: .associatedEmail
        )
        
    }
    
    private enum Keys: String, CodingKey {
        case created = "created"
        case token = "token"
        case leagueId = "league_public_id"
        case leagueName = "league_name"
        case inviteeId = "invitee_public_id"
        case accepted = "accepted"
        case associatedEmail = "associated_email"
    }

}
