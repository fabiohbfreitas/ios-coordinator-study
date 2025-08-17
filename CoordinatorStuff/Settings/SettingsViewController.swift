//
//  SettingsViewController.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//

import UIKit

class SettingsViewController: UIViewController {
    weak var coordinator: SettingsCoordinator?
    
    var inspectButton = {
        let button = UIButton(type: .system)
        button.setTitle( "Inspect", for: .normal)
        button.tintColor = .systemGreen
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
        stack.addArrangedSubview(inspectButton)
        inspectButton.addTarget(self, action: #selector(handleInspectTouch), for: .touchUpInside)
    }
    
    @objc func handleInspectTouch() {
        print(coordinator?.navigationController.viewControllers ?? "<>")
    }
}
