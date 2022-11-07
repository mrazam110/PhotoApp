//
//  DummyPhoto.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

/// This struct named DummyPhoto because it may be conflicted in the idea of the team that we are using native Photo or might be a Photo object which can have image file
struct DummyPhoto: Identifiable {
    let id: Int
    let albumId: Int
    let title: String
    let url: String
    let thumbnail: String
}
