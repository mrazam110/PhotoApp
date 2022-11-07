//
//  ReusableView.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

protocol ReusableView: AnyObject {
    static var defaultReuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: ReusableView {}
