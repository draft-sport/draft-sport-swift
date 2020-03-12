//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 10/3/20.
//

import Foundation


struct Round: Decodable {
    
    let sequence: UInt8
    let scores: Array<Score>
    
    init(from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: Keys.self)
        self.sequence = try data.decode(UInt8.self, forKey: .sequence)
        self.scores = try data.decode(Array<Score>.self, forKey: .scores)
        return
    }

    private enum Keys: String, CodingKey {
        case sequence = "round_sequence"
        case scores = "scores"
    }
    
}
