//
//  AppDelegate.swift
//  News
//
//  Created by joe on 13/02/23.
//

import UIKit
import FirebaseCore
import FirebaseFirestore
import FirebaseAuth
// import GoogleSignIn

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // FIREBASE
        FirebaseApp.configure()
        
        // GOOGLESIGNIN
        //GIDSignIn.sharedInstance().clientID = Firebase.app()?.options.clientID
        //GIDSignIn.sharedInstance().clientId = "329306487899-78dv0pfmn4k28a01td3aq3k9pfgtd4dg.apps.googleusercontent.com"
        
        // GIDSignIn.sharedInstance().clientID = FirebaseApp.app()?.options.clientID
        // GIDSignIn.sharedInstance().delegate = self
        // GIDSignIn.sharedInstance()?.restorePreviousSignIn()
        return true
    }

    // func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey: Any] = [:]) -> Bool{
    // // return GIDSignIn.sharedInstance()?.handle(url) ?? false
    // return GIDSignIn.sharedInstance()!.handle(url)
    // }
    
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

}

