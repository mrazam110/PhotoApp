//
//  AppFlowCoordinator.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

final class AppFlowCoordinator: BaseCoordinator<UINavigationController> {
    
    private let appContext: Context
    
    init(ctx: Context, navigationController: UINavigationController) {
        self.appContext = ctx
        super.init(rootViewController: navigationController)
    }
    
    override func start() {
        let dummyPhotosListCoordinator = DummyPhotosListCoordinator(ctx: appContext, controller: rootViewController)
        dummyPhotosListCoordinator.start()
    }
    
    typealias Context = AllDependencies
}
