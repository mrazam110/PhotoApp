//
//  SceneDelegate.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appCoordinator: AppFlowCoordinator?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        window = UIWindow(windowScene: windowScene)
        
        let navigationController = UINavigationController()
        window?.rootViewController = navigationController
        let dependencies: AllDependencies = DefaultDependencies()
        appCoordinator = AppFlowCoordinator(ctx: dependencies, navigationController: navigationController)
        appCoordinator?.start()
        window?.makeKeyAndVisible()
    }
}

