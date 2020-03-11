//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 10/3/20.
//

import Foundation


struct Points: Decodable {
    
    let averagePoints: UInt16
    let totalPoints: UInt16
    let pointsLastRound: UInt16
    let pointsPerMinutePlayed: UInt16
    let rounds: Array<Round>
    
    private enum Keys: String, CodingKey {
        case averagePoints = "average_points"
        case totalPoints = "total_points"
        case pointsLastRound = "points_last_round"
        case pointsPerMinutePlayed = "points_per_minute_played"
        case rounds = "rounds"
    }
    
}
