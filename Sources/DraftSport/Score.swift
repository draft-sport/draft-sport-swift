//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 10/3/20.
//

import Foundation


struct Score: Decodable {
    
    let fantasyMetricName: String
    let score: UInt16
    
    private enum Keys: String, CodingKey {
        case publicId = "fantasy_metric_name"
        case score = "UInt16"
    }
    
}
