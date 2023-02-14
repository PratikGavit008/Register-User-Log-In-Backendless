//
//  AppDelegate.swift
//  Register User
//
//  Created by Pratik Gavit on 11/02/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        if #available(iOS 13, *) {
                } else {
                    setupRoot()
                }
                return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func setupRoot() {
        let isLoggedIn = TokenService.shared.isLoggedIn()
        if isLoggedIn {
            let newVC = UIStoryboard(name: "Dashboard", bundle: nil).instantiateViewController(withIdentifier: "DashboardViewController")
            let navVC = UINavigationController(rootViewController: newVC)
            window?.rootViewController = navVC
        }
        else{
            let newVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "SignUpViewController")
            let navVC = UINavigationController(rootViewController: newVC)
            window?.rootViewController = navVC
        }
        
        window?.makeKeyAndVisible()
        }

}

