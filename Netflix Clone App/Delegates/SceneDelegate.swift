//
//  SceneDelegate.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        window?.overrideUserInterfaceStyle = .dark
        
        let navigationController = UINavigationController(rootViewController: MainTabController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

