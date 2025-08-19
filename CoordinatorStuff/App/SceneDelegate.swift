//
//  SceneDelegate.swift
//  CoordinatorStuff
//
//  Created by Fabio Freitas on 16/08/25.
//

import UIKit
import OSLog

let logger = Logger(subsystem: "fabiofreitas.CoordinatorStuff", category: "main")

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var rootCoordinator: RootCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        rootCoordinator = RootCoordinator(window)
        rootCoordinator?.start()
    }
}
