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
        let viewModel = DefaultDummyPhotosListViewModel(ctx: ctx, navigator: self)
        let controller = DummyPhotosListViewController(viewModel: viewModel)
        rootViewController.pushViewController(controller, animated: false)
    }
    
    typealias Context = DummyPhotoListContext
}

extension DummyPhotosListCoordinator: DummyPhotosListNavigator {
    func navigateToDetail(with id: Int) {
        let detailCoordinator = DummyPhotoDetailCoordinator(ctx: ctx, controller: rootViewController, dummyPhotoId: id)
        detailCoordinator.start()
    }
}

typealias DummyPhotoListContext = HasNetworkService

protocol DummyPhotosListNavigator: AnyObject {
    func navigateToDetail(with id: Int)
}
