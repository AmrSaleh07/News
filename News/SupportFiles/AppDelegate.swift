//
//  AppDelegate.swift
//  News
//
//  Created by Amr Saleh on 7/17/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    static var window: UIWindow?
    static var instance : AppDelegate!


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        AppDelegate.instance = self
        UINavigationBar.appearance().isTranslucent = false
        UINavigationBar.appearance().barTintColor = UIColor.white
        UINavigationBar.appearance().tintColor = UIColor.black
        UINavigationBar.appearance().shadowImage = UIImage()
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().titleTextAttributes = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17)]
        startApplication()
        return true
    }
    
}

extension AppDelegate {
    
    func startApplication() {
        Localization.setCurrentLanguage(to: AppLanguage.english.identifier())
        AppDelegate.window = UIWindow(frame: UIScreen.main.bounds)
        let rootVC = UINavigationController(rootViewController: instantiateVC(.home))
        AppDelegate.window?.rootViewController = rootVC
        AppDelegate.window?.backgroundColor = UIColor.white
        AppDelegate.window?.makeKeyAndVisible()
    }
}
