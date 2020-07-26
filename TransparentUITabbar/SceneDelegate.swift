//
//  SceneDelegate.swift
//  TransparentUITabbar
//
//  Created by Akhadjon Abdukhalilov on 7/19/20.
//  Copyright © 2020 Akhadjon Abdukhalilov. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let  windowScene = (scene as? UIWindowScene) else { return }
        
        window =  UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        
        window?.rootViewController = createTabbar()
        window?.makeKeyAndVisible()
        
    }

    func createTabbar() -> UITabBarController {
      let tabbar    = UITabBarController()
        UITabBar.appearance().tintColor = .green
        UITabBar.setTransparentTabbar()
        tabbar.viewControllers =  [createFirstVC(), createSecondVC()]
        return tabbar
    }
    
    func createFirstVC() -> FirstViewController {
        let viewController = FirstViewController()
        viewController.tabBarItem = UITabBarItem(tabBarSystemItem:.history, tag: 0)
        return viewController
    }
    
    func createSecondVC() -> SecondViewController {
        let viewController = SecondViewController()
            viewController.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag:1)
        return viewController
    }

}

