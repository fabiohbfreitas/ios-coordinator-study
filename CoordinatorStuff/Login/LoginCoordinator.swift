//
//  LoginCoordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

final class LoginCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    lazy var loginViewController = LoginViewController()
    
    func start() {
        print("Started \(String(describing: self))")
        loginViewController.coordinator = self
        loginViewController.navigationItem.title = "Login"
        navigationController.setViewControllers([loginViewController], animated: true)
    }
    
    func navigateToRegister() {
        parentCoordinator?.childDidFinish(self)
        let root = parentCoordinator as? RootCoordinator
        root?.startRegister()
    }
    
    func navigateToHome() {
        let home = HomeCoordinator(navigationController: navigationController)
        replaceCurrentCoordinator(with: home)
    }

    deinit {
        print("Finished \(String(describing: self))")
    }
}
