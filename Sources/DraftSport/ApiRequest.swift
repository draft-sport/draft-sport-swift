//
//  File.swift
//  
//
//  Created by Hugh Jeremy on 11/3/20.
//

import Foundation


internal class ApiRequest {
    
    private static let agent = "Draft Sport Swift 0.0.1"
    private static let endPoint = "https://draftrugby.com/api"
    private static let idHeader = "X-Draft-Sport-Session-ID"
    private static let keyHeader = "X-Draft-Sport-API-Key"
    private static let apiSession = URLSession(configuration: .ephemeral)
    private static let successCodeRange = (200...299)
    
    static func make(
        path: String,
        method: HTTPMethod,
        session: Session?,
        parameters: UrlParameters?,
        body: Data?,
        callback: @escaping (Error?, Data?) -> Void
    ) -> Void {
        
        let urlString: String
        
        if let parameters = parameters {
            urlString =  Self.endPoint + path + parameters.description
        } else {
            urlString =  Self.endPoint + path
        }
        
        guard let url = URL(string: urlString) else {
            callback(DraftSportError(.inconsistentState), nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.cachePolicy = .reloadIgnoringCacheData
        request.setValue(Self.agent, forHTTPHeaderField: "User-Agent")
        
        if let body = body {
            request.setValue(
                "application/json",
                forHTTPHeaderField: "Content-Type"
            )
            request.httpBody = body
        }
        
        if let session = session {
            request.setValue(session.apiKey, forHTTPHeaderField: Self.keyHeader)
            request.setValue(
                session.sessionId,
                forHTTPHeaderField: Self.idHeader
            )
        }
        
        Self.apiSession.dataTask(with: request) { (data, response, error) in
            Self.processResponse(
                data: data,
                response: response,
                error: error,
                callback: callback
            )
        }
        
        return
        
    }
    
    
    private static func processResponse(
        data: Data?,
        response: URLResponse?,
        error: Error?,
        callback: @escaping (Error?, Data?) -> Void
    ) -> Void {
     
        if let error = error { callback(error, nil); return }
        guard let response = response as? HTTPURLResponse else {
            callback(DraftSportError(.inconsistentState), nil)
            return
        }
        
        if Self.successCodeRange.contains(response.statusCode) {
            callback(nil, data)
            return
        }
        
        let failure: DraftSportError
    
        switch response.statusCode {
        case 400: failure = DraftSportError(.badRequest)
        case 401: failure = DraftSportError(.notAuthenticated)
        case 402: failure = DraftSportError(.subscriptionProblem)
        case 403: failure = DraftSportError(.notAuthorised)
        case 404: failure = DraftSportError(.notFound)
        case 429: failure = DraftSportError(.rateLimit)
        case 500: failure = DraftSportError(.genericServerError)
        case 502, 503, 504: failure = DraftSportError(.serviceDisruption)
        default: failure = DraftSportError(
            .inconsistentState
            )
        }
        callback(failure, nil)
        return
        
    }

}
