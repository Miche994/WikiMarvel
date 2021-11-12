//
//  AppDelegate.swift
//  WikiMarvel
//
//  Created by Betacom on 08/11/21.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController") as! ViewController
        let navVC = UINavigationController(rootViewController: vc)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

