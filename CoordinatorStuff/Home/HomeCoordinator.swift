//
//  HomeCoordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

final class HomeCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Started \(String(describing: self))")
        let home = HomeViewController()
        home.navigationItem.title = "Home"
        home.coordinator = self
        navigationController.setViewControllers([home], animated: true)
    }
    
    func navigateToLogin() {
        let login = LoginCoordinator(navigationController: navigationController)
        replaceCurrentCoordinator(with: login)
    }
    
    func navigateToSettings() {
        let settings = SettingsCoordinator(navigationController: navigationController)
        settings.parentCoordinator = self
        childCoordinators.append(settings)
        settings.start()
    }
    
    deinit {
        print("Finished \(String(describing: self))")
    }
}

