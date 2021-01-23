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
        let tableViewController = SearchEventsTableViewController()
        window?.rootViewController = UINavigationController(rootViewController: tableViewController)
        window?.makeKeyAndVisible()
        return true
    }

}

