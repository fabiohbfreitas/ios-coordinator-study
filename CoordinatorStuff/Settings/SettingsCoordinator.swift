//
//  SettingsCoordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//

import UIKit

final class SettingsCoordinator: Coordinator {
    weak var parentCoordinator: Coordinator? = nil
    var childCoordinators: [Coordinator] = []
    
    let navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        print("Started \(String(describing: self))")
        let settings = SettingsViewController()
        settings.navigationItem.title = "Settings"
        settings.coordinator = self
        navigationController.pushViewController(settings, animated: true)
    }
    
    deinit {
        print("Finished \(String(describing: self))")
    }
}

protocol SettingsTapDestination: AnyObject {
    func didTapSettings()
}
