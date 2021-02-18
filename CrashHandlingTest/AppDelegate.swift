//
//  AppDelegate.swift
//  CrashHandlingTest
//
//  Created by Hovhannes Safaryan on 15.02.21.
//

import UIKit
import Firebase



@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        FirebaseApp.configure()
        return true
    }

    // MARK: UISceneSession Lifecycle


}

