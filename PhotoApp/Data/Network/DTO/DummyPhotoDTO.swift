//
//  DummyPhotoDTO.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

struct DummyPhotoDTO: DTO {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}

extension DummyPhoto {
    static func map(from dto: DummyPhotoDTO) -> DummyPhoto {
        DummyPhoto(id: dto.id, albumId: dto.albumId, title: dto.title, url: dto.url, thumbnail: dto.thumbnailUrl)
    }
}
