//
//  UITableView+Reusable.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

extension UITableView {
    func register<T: UITableViewCell>(_: T.Type) {
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        
        register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
    }
}
