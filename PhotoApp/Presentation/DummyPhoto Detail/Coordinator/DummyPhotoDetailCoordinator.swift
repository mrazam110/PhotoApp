//
//  DummyPhotoDetailCoordinator.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class DummyPhotoDetailCoordinator: BaseCoordinator<UINavigationController> {
    
    private var ctx: Context
    private var dummyPhotoId: Int
    
    init(ctx: Context, controller: UINavigationController, dummyPhotoId: Int) {
        self.ctx = ctx
        self.dummyPhotoId = dummyPhotoId
        super.init(rootViewController: controller)
    }
    
    override func start() {
        let viewModel = DefaultDummyPhotoDetailViewModel(dummyPhotoId: dummyPhotoId, ctx: ctx)
        let controller = DummyPhotoDetailViewController(viewModel: viewModel)
        rootViewController.pushViewController(controller, animated: true)
    }
    
    typealias Context = DummyPhotoDetailContext
}

typealias DummyPhotoDetailContext = HasNetworkService
