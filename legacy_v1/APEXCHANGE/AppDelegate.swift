//
//  AppDelegate.swift
//  APEXCHANGE
//
//  Created by Bobby Laleye on 21/09/2017.
//  Copyright © 2017 APEXCHANGE. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let homeController = DealsController(collectionViewLayout : layout)
        
        if UserDefaults.standard.isLoggedIn() {
            homeController.userModel = UserDefaults.standard.getUserDetails()
            window?.rootViewController = UINavigationController(rootViewController: homeController)
        } else if !UserDefaults.standard.isLoggedIn() && !UserDefaults.standard.isNewUser() {
            window?.rootViewController = UINavigationController(rootViewController: SignInController())
        } else {
            window?.rootViewController = UINavigationController(rootViewController: OnBoardController())
        }
  
        UINavigationBar.appearance().setTitleVerticalPositionAdjustment(0, for: .default)
        UINavigationBar.appearance().setBackgroundImage(UIImage(), for: .default)
        UINavigationBar.appearance().shadowImage = UIImage()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}
