//
//  CommunicationMethod.swift
//  DraftSport
//
//  Created by Hugh Jeremy on 29/2/20.
//

import Foundation


public class CommunicationMethod: Decodable {
    
    public let publicId: String
    public let mode: CommunicationMode
    public let body: String
    public let confirmed: Bool
    
    init(
        publicId: String,
        mode: CommunicationMode,
        body: String,
        confirmed: Bool
    ) {
        
        self.publicId = publicId
        self.mode = mode
        self.body = body
        self.confirmed = confirmed

        return

    }
    
    public required init(from decoder: Decoder) throws {

        let data = try decoder.container(keyedBy: Keys.self)
        publicId = try data.decode(String.self, forKey: .publicId)
        mode = try data.decode(CommunicationMode.self, forKey: .mode)
        body = try data.decode(String.self, forKey: .body)
        confirmed = try data.decode(Bool.self, forKey: .confirmed)

        return
    }
    
    private enum Keys: String, CodingKey {
        case publicId = "public_id"
        case mode = "mode"
        case body = "body"
        case confirmed = "confirmed"
    }
    
}
