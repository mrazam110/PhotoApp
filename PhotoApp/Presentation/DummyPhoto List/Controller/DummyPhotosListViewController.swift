//
//  DummyPhotosListViewController.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class DummyPhotosListViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private var viewModel: DummyPhotosListViewModel
    
    // MARK: - Inits
    
    init(viewModel: DummyPhotosListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DummyPhotosListViewModel", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        navigationItem.title = viewModel.screenTitle
    }
    
    private func  bindViewModel() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension DummyPhotosListViewController: UITableViewDelegate, UITableViewDataSource {
    
}
