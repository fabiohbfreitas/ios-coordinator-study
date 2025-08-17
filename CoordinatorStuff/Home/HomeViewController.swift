//
//  HomeViewController.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

class HomeViewController: UIViewController {
    weak var coordinator: HomeCoordinator?
    
    var logoutButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Logout", for: .normal)
        button.tintColor = .red
        return button
    }()
    
    var settingsButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Settings", for: .normal)
        return button
    }()
    
    var stack = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()
    
    override func viewDidLoad() {
        setup()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        view.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: view.centerYAnchor)])
        stack.addArrangedSubview(settingsButton)
        settingsButton.addTarget(self, action: #selector(handleSettingsTouch), for: .touchUpInside)
        stack.addArrangedSubview(logoutButton)
        logoutButton.addTarget(self, action: #selector(handleLogoutTouch), for: .touchUpInside)
    }
    
    @objc func handleLogoutTouch() {
        coordinator?.navigateToLogin()
    }
    
    @objc func handleSettingsTouch() {
        coordinator?.navigateToSettings()
    }
}
