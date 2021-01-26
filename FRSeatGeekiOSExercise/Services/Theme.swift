//
//  Theme.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

class Theme {
    static let cardHeight: CGFloat = 215
    static let cornerRadius: CGFloat = 3
    static let borderWidth: CGFloat = 1
    static let shadowRadius: CGFloat = cornerRadius
    static let shadowOpacity: Float = 0.15
    static let shadowOffset: CGSize = CGSize(width: 0, height: 1.0)

    
}

extension UIColor {
    // TODO: should be made to use iOS 13 colors to support light/dark mode
    // Example:
    //    static let primaryBackground: UIColor = {
    //        if #available(iOS 13.0, *) {
    //            return .systemBackground
    //        } else {
    //            return .white
    //        }
    //    }()
    
    static let primaryBackground: UIColor = .white
    static let separatorColor: UIColor = .lightGray
    
    static let primaryLabel: UIColor = .black
    static let secondaryLabel: UIColor = .darkGray
    
    static let heartColor = UIColor(red: 0.7, green: 0, blue: 0, alpha: 1.0)

}

