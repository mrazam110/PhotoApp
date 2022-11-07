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
        super.init(nibName: "DummyPhotosListViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        bindViewModel()
        registerCells()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private Methods
    
    private func setupViews() {
        navigationItem.title = viewModel.screenTitle
    }
    
    private func bindViewModel() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }
        }
    }
    
    private func registerCells() {
        tableView.register(DummyPhotoListCell.self)
    }
}

// MARK: - UITableViewDelegate and UITableViewDataSource

extension DummyPhotosListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dummyPhotos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "DummyPhotoListCell", for: indexPath) as? DummyPhotoListCell else {
            return UITableViewCell()
        }
        
        let data = DummyPhotoListCellData.map(from: viewModel.dummyPhotos[indexPath.row])
        cell.configure(with: data)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
