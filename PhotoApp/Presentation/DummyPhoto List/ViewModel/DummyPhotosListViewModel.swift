//
//  DummyPhotosListViewModel.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

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
    
    // MARK: - Computed Properties
    
    var screenTitle: String {
        "Dummy Photos"
    }
    
    // MARK: - Output Closure Properties
    
    var reloadData: (() -> Void)?
    
    // MARK: - Inits
    
    init(ctx: Context) {
        self.ctx = ctx
    }
    
    // MARK: - Input Methods
    
    func viewDidLoad() {
        
    }
    
    func photoSelected(at index: Int) {
        
    }
    
    typealias Context = HasNetworkService
}
