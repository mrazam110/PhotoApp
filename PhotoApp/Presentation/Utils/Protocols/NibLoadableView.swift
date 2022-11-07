//
//  NibLoadableView.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

protocol NibLoadableView: AnyObject {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: self).components(separatedBy: ".").last!
    }
}

extension UITableViewCell: NibLoadableView {}
