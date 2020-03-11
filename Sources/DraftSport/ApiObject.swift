//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


internal protocol ApiObject {
    
    static func decode(
        error: Error?,
        data: Data?,
        callback: @escaping (Error?, Self?) -> Void
    ) -> Void
    
}

extension ApiObject {

    static func decode<T>(
        error: Error?,
        data: Data?,
        callback: @escaping (Error?, T?) -> Void
    ) -> Void where T : Decodable {
        
        guard let data = data else {
            callback(error ?? DraftSportError(.inconsistentState), nil)
            return
        }
        
        let decoder = JSONDecoder()
        let output: T

        do {
            output = try decoder.decode(T.self, from: data)
        } catch {
            callback(error, nil); return
        }
        
        callback(nil, output)
        
        return

    }

}
