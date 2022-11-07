//
//  DummyPhotoListCell.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

struct DummyPhotoListCellData {
    let thumbnail: URL?
    let title: String
}

extension DummyPhotoListCellData {
    static func map(from dummyPhoto: DummyPhoto) -> DummyPhotoListCellData {
        let thumbnailURL = URL(string: dummyPhoto.thumbnail)
        return DummyPhotoListCellData(thumbnail: thumbnailURL, title: dummyPhoto.title)
    }
}

class DummyPhotoListCell: UITableViewCell {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var thumbnailImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    
    func configure(with data: DummyPhotoListCellData) {
        titleLabel.text = data.title
        if let imageURL = data.thumbnail {
            thumbnailImageView.loadImage(from: imageURL)
        }
    }
}
