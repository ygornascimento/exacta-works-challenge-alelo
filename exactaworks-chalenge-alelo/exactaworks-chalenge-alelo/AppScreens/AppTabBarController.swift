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
    }
    
    private func setupTabBarViewControllers() {
        let homeNavigationController = UINavigationController(rootViewController: HomeViewController())
        navigationController?.navigationBar.prefersLargeTitles = true
        homeNavigationController.tabBarItem.image = UIImage(systemName: "list.bullet.rectangle")
        homeNavigationController.tabBarItem.title = "Produtos"
        
        let shoppingCartNavigationController = UINavigationController(rootViewController: ShoppingCartScreenViewController())
        navigationController?.navigationBar.prefersLargeTitles = true
        shoppingCartNavigationController.tabBarItem.image = UIImage(systemName: "cart")
        shoppingCartNavigationController.tabBarItem.title = "Carrinho"
        
        viewControllers = [homeNavigationController, shoppingCartNavigationController]
    }
    
}
