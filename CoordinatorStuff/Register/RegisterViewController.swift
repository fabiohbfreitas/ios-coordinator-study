//
//  RegisterViewController.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//


import UIKit

class RegisterViewController: UIViewController {
    weak var coordinator: RegisterCoordinator?
    
    var button = {
        let button = UIButton(type: .system)
        button.setTitle( "Already have an account?", for: .normal)
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
        stack.addArrangedSubview(button)
        button.addTarget(self, action: #selector(handleDestinationTouch), for: .touchUpInside)
    }
    
    @objc func handleDestinationTouch() {
        coordinator?.navigateToLogin()
    }
}
