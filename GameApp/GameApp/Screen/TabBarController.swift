//
//  MainTabbarController.swift
//  GameApp
//
//  Created by Alperen Arıcı on 25.05.2021.
//
import UIKit
import CoreNetwork

final class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupChildViewControllers()
    }
    
    private func setupChildViewControllers() {
        guard let viewControllers = viewControllers else {
            return
        }
        
        for viewController in viewControllers {
            var childViewController: UIViewController?
            
            if let navigationController = viewController as? UINavigationController {
                childViewController = navigationController.viewControllers.first
            } else {
                childViewController = viewController
            }
            
            switch childViewController {
            case let viewController as GameListViewController:
                let viewModel = GameListViewModel(networkManager: NetworkManager())
                viewController.viewModel = viewModel
                break
            case _ as WishListViewController:
                break
            default:
                break
            }
        }
    }
    
}