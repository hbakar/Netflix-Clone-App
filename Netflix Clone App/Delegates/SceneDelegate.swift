//
//  SceneDelegate.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow? {
        didSet {
            window?.overrideUserInterfaceStyle = .dark
        }
    }

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
      
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        
        let splashViewController = SplashViewController(nibName: String(describing: SplashViewController.self), bundle: .main)
        
      //  let detailViewController = DetailViewController(nibName: String(describing: DetailViewController.self), bundle: .main)
        
        let navigationController = UINavigationController(rootViewController: splashViewController)
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }

}

