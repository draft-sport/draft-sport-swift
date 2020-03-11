//
//  Human.swift
//  DraftSport
//
//  Created by Hugh Jeremy on 29/2/20.
//

import Foundation


public class Human: Decodable {
    
    public let publicId: String
    
    init(
        publicId: String
    ) {
        self.publicId = publicId
        return
    }
    
    public required init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: Keys.self)
        publicId = try data.decode(String.self, forKey: Keys.publicId)
        return
    }

    private enum Keys: String, CodingKey {
        case publicId = "public_id"
    }

}
