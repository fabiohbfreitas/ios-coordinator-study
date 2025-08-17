//
//  RegisterCoordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

final class RegisterCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Started \(String(describing: self))")
        let reg = RegisterViewController()
        reg.navigationItem.title = "Register"
        reg.coordinator = self
        navigationController.setViewControllers([reg], animated: true)
    }
    
    func navigateToLogin() {
        parentCoordinator?.childDidFinish(self)
        let root = parentCoordinator as? RootCoordinator
        root?.startLogin()
    }
    
    deinit {
        print("Finished \(String(describing: self))")
    }
}
