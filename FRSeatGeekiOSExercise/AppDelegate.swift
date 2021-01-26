//
//  AppDelegate.swift
//  FRSeatGeekiOSExercise
//
//  Created by Brandon Baker on 1/23/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        let tableViewController = SearchEventsTableViewController(style: .grouped)
        let navigationController = UINavigationController(rootViewController: tableViewController)
        navigationController.view.backgroundColor = .primaryBackground
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }

}

