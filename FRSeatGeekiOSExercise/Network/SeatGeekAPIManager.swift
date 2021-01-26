//
//  SeatGeekAPIManager.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

fileprivate let baseURL = "https://api.seatgeek.com/2"
fileprivate let clientIdParam = "client_id"
fileprivate let secretParam = "client_secret"

// MARK: SeatGeekPath
enum SeatGeekPath {
    case events
    case performers
    case venues
    
    case event(id: String)
    case performer(id: String)
    case venue(id: String)
    
    var path: String {
        switch self {
        case .events:
            return "/events"
        case .performers:
            return "/performers"
        case .venues:
            return "/venues"
        case .event(let id):
            return "/events/\(id)"
        case .performer(let id):
            return "/performers/\(id)"
        case .venue(let id):
            return "/venues/\(id)"
        }
    }
    
    var endpoint: String {
        return "\(baseURL)\(path)"
    }
}


// MARK: SeatGeekAPIManager
class SeatGeekAPIManager {
    
    private static var headers: [String: String] {
        return [
            "Content-Type": "application/json",
        ]
    }
    
    private static var queryItems: [URLQueryItem] {
        return [
            URLQueryItem(name: clientIdParam, value: Secrets.seatGeekClientId),
            URLQueryItem(name: secretParam, value: Secrets.seatGeekSecret)
            
        ]
    }
    
    public static func queryEvents(completion: @escaping ([Event]?) -> Void) {
        NetworkManager.shared.networkRequest(SeatGeekPath.events.endpoint,
                                             queryItems: queryItems,
                                             headers: headers) { data in
            guard let eventsDict = data["events"] as? [[String:Any]] else {
                completion(nil)
                return
            }
            
            let events = eventsDict.compactMap({ Event($0) })
            
            completion(events)
            
        }
    }
    

}
