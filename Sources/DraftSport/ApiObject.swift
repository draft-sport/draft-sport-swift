//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


internal protocol ApiDecodable {
    
    static func decode(
        error: Error?,
        data: Data?,
        callback: @escaping (Error?, Self?) -> Void
    ) -> Void
    
    static func decodeMany(
        error: Error?,
        data: Data?,
        callback: @escaping (Error?, Array<Self>?) -> Void
    ) -> Void
    
}

extension ApiDecodable {

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
    
    static func decodeMany<T>(
        error: Error?,
        data: Data?,
        callback: @escaping (Error?, Array<T>?) -> Void
    ) -> Void where T : Decodable {
        
        guard let data = data else {
            callback(error ?? DraftSportError(.inconsistentState), nil)
            return
        }
        
        let decoder = JSONDecoder()
        let output: Array<T>

        do {
            output = try decoder.decode(Array<T>.self, from: data)
        } catch {
            callback(error, nil); return
        }
        
        callback(nil, output)
        
        return

    }

}
