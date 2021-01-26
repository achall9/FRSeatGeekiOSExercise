//
//  NetworkManager.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

class NetworkManager {

    static let shared = NetworkManager()
    
    public func networkRequest(_ endpoint: String,
                               queryItems: [URLQueryItem]? = nil,
                               headers: [String: String]? = nil,
                               completion: @escaping ([String: Any]) -> Void) {
        
        guard var urlComponents = URLComponents(string: endpoint) else {
            NetworkErrorManager.handleError(NetworkURLError())
            return
        }
        
        if let queryItems = queryItems {
            urlComponents.queryItems = queryItems
        }
        
        guard let url = urlComponents.url else {
            NetworkErrorManager.handleError(NetworkURLError())
            return
        }
        
        var request = URLRequest(url: url)
        
        if let headers = headers {
            for (key, value) in headers {
                request.addValue(value, forHTTPHeaderField: key)
            }
        }
        
        let session = URLSession.shared
        
        let task = session.dataTask(with: request, completionHandler: { data, response, error in
            
            if let error = error {
                NetworkErrorManager.handleError(error)
            }
        
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                NetworkErrorManager.handleError(ServerError())
                return
            }
            
            guard let mime = httpResponse.mimeType, mime == "application/json" else {
                NetworkErrorManager.handleError(WrongMIMEError())
                return
            }
            
            guard let data = data else {
                NetworkErrorManager.handleError(InvalidDataError())
                return
            }
            
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: [])
                
                guard let dict = json as? [String: Any] else {
                    NetworkErrorManager.handleError(InvalidDataError())
                    return
                }
                
                completion(dict)
            } catch {
                NetworkErrorManager.handleError(error)
            }
            
        })
        
        task.resume()
    }
    
}
