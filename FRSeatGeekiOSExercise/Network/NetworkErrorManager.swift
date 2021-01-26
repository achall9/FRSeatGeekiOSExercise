//
//  ErrorManager.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

/// Oversimplified example just for demo
class WrongMIMEError: Error {}
class ServerError: Error {}
class InvalidDataError: Error {}
class NetworkURLError: Error {}

class NetworkErrorManager {
    
    static func handleError(_ error: Error) {
        print("ERROR: \(error) - \(error.localizedDescription)")
    }
    
}
