//
//  LoginViewController.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

class LoginViewController: UIViewController {
    weak var coordinator: LoginCoordinator?
    
    var registerButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Dont have an accout? Register", for: .normal)
        return button
    }()
    
    var homeButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Successful login", for: .normal)
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
        stack.addArrangedSubview(registerButton)
        registerButton.addTarget(self, action: #selector(handleTouchDestination), for: .touchUpInside)
        stack.addArrangedSubview(homeButton)
        homeButton.addTarget(self, action: #selector(handleTouchSuccessDestination), for: .touchUpInside)
    }
    
    @objc func handleTouchDestination() {
        coordinator?.navigateToRegister()
    }
    
    @objc func handleTouchSuccessDestination() {
        coordinator?.navigateToHome()
    }
}
