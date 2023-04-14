//
//  ViewController.swift
//  My Diary
//
//  Created by Dima on 02.04.2023.
//

import UIKit

class TabBarController: UITabBarController {

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupControllers()
        setupAppearance()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Helper.Color.Main.dark
    }

    
    // MARK: - Methods
    // Methods for setup controllers to in TabBarControllers
    private func setupControllers() {
        let mainVC = createControllers(inputVC: DiaryViewController(),
                                       image: Helper.Image.TabBar.diary,
                                       title: Helper.String.TabBar.diary)
        let settingsVC = createControllers(inputVC: SettingsViewController(),
                                           image: Helper.Image.TabBar.settings,
                                           title: Helper.String.TabBar.settings)
        viewControllers = [mainVC, settingsVC]
    }
    
    // Method for create new controller
    private func createControllers(inputVC: UIViewController, image: UIImage, title: String) -> UIViewController {
        let viewController = UINavigationController(rootViewController: inputVC)
        viewController.tabBarItem.image = image
        viewController.tabBarItem.title = title
        tabBar.tintColor = Helper.Color.Main.light
        tabBar.unselectedItemTintColor = Helper.Color.Main.middle
        return viewController
    }
    
    private func setupAppearance() {
        // Setup backgroung color for UITabBar
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundColor = Helper.Color.Main.dark
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
        
        // Setup backgroung color for UINavigationBar
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        navigationBarAppearance.backgroundColor = Helper.Color.Main.dark
        navigationItem.standardAppearance = navigationBarAppearance
        navigationItem.scrollEdgeAppearance = navigationBarAppearance
    }
}

