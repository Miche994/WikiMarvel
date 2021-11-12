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
    
    private(set) var imageDataSource: ImageDataProvider!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let imageDownloader = ImageDownloader()
        let imageCacher = ImageCacher()
        
        imageDataSource = ImageDataProvider(downloader: imageDownloader, cacheHandler: imageCacher)
        
        let vc = ViewController.newInstance(dataSource: imageDataSource)
        let navVC = UINavigationController(rootViewController: vc)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navVC
        window?.makeKeyAndVisible()
        
        return true
    }

}

