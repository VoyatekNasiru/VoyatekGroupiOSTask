//
//  DashboardViewController.swift
//  VoyatekGroupiOSTask
//
//  Created by Danjuma Nasiru on 19/02/2025.
//

import UIKit

class DashboardViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }
    
    private func setup() {
        let generatorController = GeneratorViewController()
        generatorController.tabBarItem = UITabBarItem(title: "Generator", image: UIImage(named: "magicpen"), tag: 2)
        let generatorControllerNav = UINavigationController(rootViewController: generatorController)
        
        let foodController = AddFoodViewController()
        foodController.tabBarItem = UITabBarItem(title: "Add", image: UIImage(systemName: "plus.circle"), tag: 3)
        let foodControllerNav = UINavigationController(rootViewController: foodController)
        
        let favoriteController = FavoriteViewController()
        favoriteController.tabBarItem = UITabBarItem(title: "Favourite", image: UIImage(systemName: "heart"), tag: 4)
        let favoriteControllerNav = UINavigationController(rootViewController: favoriteController)
        
        let plannerController = PlannerViewController()
        plannerController.tabBarItem = UITabBarItem(title: "Planner", image: UIImage(named: "calendar"), tag: 5)
        let plannerControllerNav = UINavigationController(rootViewController: plannerController)
        
        viewControllers?.append(contentsOf: [ generatorControllerNav, foodControllerNav, favoriteControllerNav, plannerControllerNav])
    }
}
