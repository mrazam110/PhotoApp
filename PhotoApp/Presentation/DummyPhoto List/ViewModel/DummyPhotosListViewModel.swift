//
//  DummyPhotosListViewModel.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import Foundation

protocol DummyPhotosListViewModelInput {
    func viewDidLoad()
    func photoSelected(at index: Int)
}

protocol DummyPhotosListViewModelOutput {
    var screenTitle: String { get }
    var dummyPhotos: [DummyPhoto] { get }
    
    // Output closures
    var reloadData: (() -> Void)? { get set }
}

protocol DummyPhotosListViewModel: DummyPhotosListViewModelInput, DummyPhotosListViewModelOutput {}

final class DefaultDummyPhotosListViewModel: DummyPhotosListViewModel {
    
    // MARK: - Properties
    
    private(set) var dummyPhotos: [DummyPhoto] = []
    private var ctx: Context
    
    private var dummyPhotosRepository: DummyPhotoRepository
    
    private var navigator: DummyPhotosListNavigator?
    
    // MARK: - Computed Properties
    
    var screenTitle: String {
        "Dummy Photos"
    }
    
    // MARK: - Output Closure Properties
    
    var reloadData: (() -> Void)?
    
    // MARK: - Inits
    
    init(ctx: Context, navigator: DummyPhotosListNavigator) {
        self.ctx = ctx
        self.navigator = navigator
        self.dummyPhotosRepository = DefaultDummyPhotoRepository(ctx: ctx)
    }
    
    // MARK: - Input Methods
    
    func viewDidLoad() {
        dummyPhotosRepository.fetchDummyPhotoList { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let photos):
                self.dummyPhotos = photos
            case .failure(let error):
                print(error)
            }
            self.reloadData?()
        }
    }
    
    func photoSelected(at index: Int) {
        let dummyPhotoId = dummyPhotos[index].id
        navigator?.navigateToDetail(with: dummyPhotoId)
    }
    
    typealias Context = DummyPhotoListContext
}
