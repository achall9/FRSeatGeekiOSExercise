//
//  FillerText.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

/// For Demonstration purposes only.
class FillerText {
    
    static let loremEpsum = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
    
    enum FillerTextType {
        case title
        case description
        case subtitle
        
        var characterCount: Int {
            switch self {
            case .title:
                return 20
            case .description:
                return 140
            case .subtitle:
                return 40
            }
        }
    }
    
    static func getString(_ type: FillerText.FillerTextType) -> String {
        return String(Array(loremEpsum)[0..<type.characterCount])
    }
    
}
