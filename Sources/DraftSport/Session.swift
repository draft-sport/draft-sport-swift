//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


public class Session {
    
    let apiKey: String
    let sessionId: String
    
    init(
        apiKey: String,
        sessionId: String
    ) {
        self.apiKey = apiKey
        self.sessionId = sessionId
        return
    }
    
}
