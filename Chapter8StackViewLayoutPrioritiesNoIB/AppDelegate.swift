//
//  AppDelegate.swift
//  Chapter8StackViewLayoutPrioritiesNoIB
//
//  Created by Herve Desrosiers on 2020-03-10.
//  Copyright © 2020 Herve Desrosiers. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemTeal
        
        let profile = Profile(name: "Sue Appleseed", bio: "Deep sea diver. Donut maker. Tea drinker.", avatar: nil)
        let profileViewController = ViewController()
        profileViewController.profile = profile
        
        navigationController = UINavigationController(rootViewController: profileViewController)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        return true
    }


}

