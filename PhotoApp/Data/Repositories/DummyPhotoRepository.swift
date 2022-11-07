//
//  DummyPhotoRepository.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

protocol DummyPhotoRepository {
    func fetchDummyPhotoList(completion: @escaping (Result<[DummyPhoto], Error>) -> Void)
}

final class DefaultDummyPhotoRepository: DummyPhotoRepository {
    
    private var ctx: Context
    
    init(ctx: Context) {
        self.ctx = ctx
    }
    
    func fetchDummyPhotoList(completion: @escaping (Result<[DummyPhoto], Error>) -> Void) {
        let endpoint = DummyPhotosEndpointProvider(baseURL: ctx.baseURL)
        ctx.networkManager.request(endpoint) { result in
            switch result {
            case .failure(let error):
                completion(.failure(error))
            case .success(let response):
                let dummyPhotos = response.map { DummyPhoto.map(from: $0) }
                completion(.success(dummyPhotos))
            }
        }
    }
    
    typealias Context = HasNetworkService
}
