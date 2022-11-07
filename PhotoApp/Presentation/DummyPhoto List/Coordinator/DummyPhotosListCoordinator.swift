//
//  DummyPhotosListCoordinator.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class DummyPhotosListCoordinator: BaseCoordinator<UINavigationController> {
    
    private var ctx: Context
    
    init(ctx: Context, controller: UINavigationController) {
        self.ctx = ctx
        super.init(rootViewController: controller)
    }
    
    override func start() {
        let viewModel = DefaultDummyPhotosListViewModel(ctx: ctx)
        let controller = DummyPhotosListViewController(viewModel: viewModel)
        rootViewController.pushViewController(controller, animated: false)
    }
    
    typealias Context = DummyPhotoListContext
}

typealias DummyPhotoListContext = HasNetworkService
