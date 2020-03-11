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

    private enum Keys: String, CodingKey {
        case sequence = "sequence"
        case scores = "scores"
    }
    
}
