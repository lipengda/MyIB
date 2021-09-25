//
//  AppDelegate.swift
//  MyIB
//
//  Created by 李鹏达 on 2021/9/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow.init(frame: UIScreen.main.bounds)
        
        let main = UIStoryboard.init(name: "Main", bundle: nil)
        let root = main.instantiateInitialViewController()
        window?.rootViewController = root
        
        return true
    }

}

