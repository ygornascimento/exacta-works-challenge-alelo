//
//  AppTabBarController.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 08/12/23.
//

import UIKit

final class AppTabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTabBarViewControllers()
        setupTabBarLayout()
    }
    
    private func setupTabBarViewControllers() {
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        homeNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")
        homeNavigationController.tabBarItem.title = "Produtos"
        
        let shoppingCartNavigationController = UINavigationController(rootViewController: ShoppingCartScreenViewController())
        shoppingCartNavigationController.tabBarItem.image = UIImage(systemName: "cart")
        shoppingCartNavigationController.tabBarItem.title = "Carrinho"
        
        viewControllers = [homeNavigationController, shoppingCartNavigationController]
    }
    
    private func setupTabBarLayout() {
//        tabBar.tintColor = #colorLiteral(red: 0.9490196078, green: 0.8078431373, blue: 0.431372549, alpha: 1)
//        tabBar.barTintColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    }
    
}
