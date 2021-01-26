//
//  HapticManager.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/24/21.
//

import UIKit

class HapticManager {
    private static let notificationFeedbackGenerator = UINotificationFeedbackGenerator()
    static func success() {
        notificationFeedbackGenerator.notificationOccurred(.success)
    }
}
