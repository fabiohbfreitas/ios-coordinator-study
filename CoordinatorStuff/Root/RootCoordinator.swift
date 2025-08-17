//
//  RootCoordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

final class RootCoordinator: Coordinator {
    let window: UIWindow
    
    var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(_ window: UIWindow) {
        self.window = window
        self.navigationController = UINavigationController()
    }
    
    func start() {
        print("Started \(String(describing: self))")
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        
        startLogin()
    }
    
    func startLogin() {
        let login = LoginCoordinator(navigationController: navigationController)
        childCoordinators.append(login)
        login.parentCoordinator = self
        login.start()
    }
    
    func startRegister() {
        let reg = RegisterCoordinator(navigationController: navigationController)
        childCoordinators.append(reg)
        reg.parentCoordinator = self
        reg.start()
    }
}
