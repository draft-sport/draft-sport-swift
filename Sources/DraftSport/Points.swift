//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 10/3/20.
//

import Foundation


public struct Points: Decodable {
    
    let averagePoints: UInt16
    let totalPoints: UInt16
    let pointsLastRound: UInt16
    let pointsPerMinutePlayed: Float
    let rounds: Array<Round>?
    
    public init(
        averagePoints: UInt16,
        totalPoints: UInt16,
        pointsLastRound: UInt16,
        pointsPerMinutePlayed: Float,
        rounds: Array<Round>?
    ) {
        self.averagePoints = averagePoints
        self.totalPoints = totalPoints
        self.pointsLastRound = pointsLastRound
        self.pointsPerMinutePlayed = pointsPerMinutePlayed
        self.rounds = rounds
        return
    }
    
    public init (from decoder: Decoder) throws {
        let data = try decoder.container(keyedBy: Keys.self)
        self.averagePoints = try data.decode(
            UInt16.self, forKey: .averagePoints
        )
        self.totalPoints = try data.decode(UInt16.self, forKey: .totalPoints)
        self.pointsLastRound = try data.decode(
            UInt16.self,
            forKey: .pointsLastRound
        )
        self.pointsPerMinutePlayed = try data.decode(
            Float.self,
            forKey: .pointsPerMinutePlayed
        )
        self.rounds = try data.decodeIfPresent(
            Array<Round>.self,
            forKey: .rounds
        )
        return
    }
    
    private enum Keys: String, CodingKey {
        case averagePoints = "average_points"
        case totalPoints = "total_points"
        case pointsLastRound = "points_last_round"
        case pointsPerMinutePlayed = "points_per_minute_played"
        case rounds = "rounds"
    }
    
}
