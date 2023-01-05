//
//  AppDelegate.swift
//  generalDictionary
//
//  Created by Mac on 05/01/23.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        let navigation = UINavigationController()
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigation
        window?.makeKeyAndVisible() //para hacerla la principal y visible
        
        //instancia la vista a la que se va a llamar
        let vc = HomeMain.createModule(navigation: navigation)
        //se le hace push (se visualiza la vista)
        navigation.pushViewController(vc, animated: true)
        return true
    }
}

