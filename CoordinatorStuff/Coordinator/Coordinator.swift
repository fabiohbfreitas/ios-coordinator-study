//
//  Coordinator.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

protocol Coordinator: AnyObject {
    var parentCoordinator: Coordinator? { get set }
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get }
    func start()
}

extension Coordinator {
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() where coordinator === child {
            childCoordinators.remove(at: index)
            break
        }
    }
    
    func replaceCurrentCoordinator(with coordinator: Coordinator) {
        print("Replacing \(String(describing: self)) with \(String(describing: coordinator))")
        parentCoordinator?.childCoordinators.append(coordinator)
        coordinator.parentCoordinator = parentCoordinator
        parentCoordinator?.childDidFinish(self)
        coordinator.start()
    }
}
