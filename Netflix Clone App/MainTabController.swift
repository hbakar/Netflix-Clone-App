//
//  MainTabController.swift
//  Netflix Clone App
//
//  Created by Hüseyin BAKAR on 9.01.2024.
//

import UIKit

final class MainTabController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        let homeViewController = HomeViewController(nibName: String(describing:HomeViewController.self), bundle: .main)
        let upcomingViewController = UpcomingViewController(nibName: String(describing: UpcomingViewController.self), bundle: .main)
        let searchViewController = SearchViewController(nibName: String(describing: SearchViewController.self), bundle: .main)
        let downloadsViewController = DownloadsViewController(nibName: String(describing: DownloadsViewController.self), bundle: .main)
        
        let navigationControllerHome = UINavigationController(rootViewController: homeViewController)
        let navigationControllerUpcoming = UINavigationController(rootViewController: upcomingViewController)
        let navigationControllerSearch = UINavigationController(rootViewController: searchViewController)
        let navigationControllerDownloads = UINavigationController(rootViewController: downloadsViewController)
        
        navigationControllerHome.tabBarItem.image = UIImage(systemName: "house")
        navigationControllerUpcoming.tabBarItem.image = UIImage(systemName: "play.circle")
        navigationControllerSearch.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        navigationControllerDownloads.tabBarItem.image = UIImage(systemName: "arrow.down.to.line")
        
        navigationControllerHome.title = "Home"
        navigationControllerUpcoming.title = "Coming Soon"
        navigationControllerSearch.title = "Top Search"
        navigationControllerDownloads.title = "Downloads"
        
        tabBar.tintColor = .label
        
        setViewControllers([navigationControllerHome,navigationControllerUpcoming,navigationControllerSearch,navigationControllerDownloads], animated: true)
    }
    
}
