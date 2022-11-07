//
//  AppFlowCoordinator.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

final class AppFlowCoordinator: Coordinator {
    
    private let appContext: Context
    
    var navigationController: UINavigationController
    
    init(ctx: Context, navigationController: UINavigationController) {
        self.appContext = ctx
        self.navigationController = navigationController
    }
    
    func start() {
        
    }
    
    typealias Context = AllDependencies
}
