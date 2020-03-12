//
//  UrlParamters.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


internal struct UrlParameters: CustomStringConvertible {
    
    let parameters: Array<UrlParameter>

    var description: String { return self.parameterString }
    
    var parameterString: String {
        if (self.parameters.count < 1) { return "" }
        var workingString = "?" + String(describing: self.parameters[0])
        for parameter in self.parameters.dropFirst() {
            workingString += "&" + String(describing: parameter)
        }
        return workingString
    }
    
    init(_ parameters: Array<UrlParameter>) {
        self.parameters = parameters
        return
    }
    
    init(singleKey key: String, singleValue value: String) {
        self.parameters = [UrlParameter(value, withKey: key)]
        return
    }
    
    init(singleKey key: String, singleValue value: Int) {
        self.parameters = [UrlParameter(value, withKey: key)]
        return
    }

    
}
