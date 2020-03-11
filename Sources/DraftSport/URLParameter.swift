//
//  UrlParameter.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


internal struct UrlParameter: CustomStringConvertible {
    
    let key: String
    let value: String
    
    var description: String { get { return key + "=" + value} }
    
    init(_ stringValue: String, withKey key: String) {
        self.key = key
        self.value = stringValue
    }
    
    init(_ convertibleValue: CustomStringConvertible, withKey key: String) {
        self.key = key
        self.value = convertibleValue.description
    }
    
    init(_ integerValue: Int, withKey key: String) {
        self.key = key
        self.value = String(integerValue)
    }
    
}

extension UrlParameter: Hashable {
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(key)
        hasher.combine(value)
    }
    
    static func == (lhs: UrlParameter, rhs: UrlParameter) -> Bool {
        return lhs.key == rhs.key && lhs.value == rhs.value
    }
}
