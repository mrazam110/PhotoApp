//
//  DummyPhotoDetailView.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

protocol DummyPhotoDetailViewInput {
    func viewDidLoad()
}

protocol DummyPhotoDetailViewOutput {
    var screenTitle: String { get }
    
    var idText: String { get }
    var albumIdText: String { get }
    var titleText: String { get }
    var imageURL: URL? { get }
    
    // Output closures
    var reloadData: (() -> Void)? { get set }
}

protocol DummyPhotoDetailViewModel: DummyPhotoDetailViewInput, DummyPhotoDetailViewOutput {}

final class DefaultDummyPhotoDetailViewModel: DummyPhotoDetailViewModel {
    
    // MARK: - Properties
    
    let dummyPhotoId: Int
    
    private var dummyPhoto: DummyPhoto?
    private var ctx: Context
    
    private var dummyPhotosRepository: DummyPhotoRepository
    
    // MARK: - Computed Properties
    
    var screenTitle: String {
        "Dummy Photo"
    }
    
    var idText: String {
        return "ID: \(dummyPhoto?.id.toString() ?? "")"
    }
    
    var albumIdText: String {
        return "Album ID: \(dummyPhoto?.albumId.toString() ?? "")"
    }
    
    var titleText: String {
        return dummyPhoto?.title ?? ""
    }
    
    var imageURL: URL? {
        guard let url = dummyPhoto?.url else { return nil }
        return URL(string: url)
    }
    
    // MARK: - Output Closure Properties
    
    var reloadData: (() -> Void)?
    
    // MARK: - Inits
    
    init(dummyPhotoId: Int, ctx: Context) {
        self.dummyPhotoId = dummyPhotoId
        self.ctx = ctx
        self.dummyPhotosRepository = DefaultDummyPhotoRepository(ctx: ctx)
    }
    
    // MARK: - Input Methods
    
    func viewDidLoad() {
        dummyPhotosRepository.fetchDummyPhoto(by: dummyPhotoId) { [weak self] result in
            guard let self = self else { return }
            
            switch result {
            case .success(let dummyPhoto):
                self.dummyPhoto = dummyPhoto
            case .failure(let error):
                print(error)
            }
            self.reloadData?()
        }
    }
    
    typealias Context = DummyPhotoDetailContext
}
