//
//  BaseCoordinator.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class BaseCoordinator<T: UIViewController>: Coordinator {
    let rootViewController: T
    
    // MARK: - init
    
    init(rootViewController: T) {
        self.rootViewController = rootViewController
    }
    
    // MARK: - Public Methods
    
    /// show first view controller
    func start() {
        assertionFailure("child class must override it.")
    }
}
