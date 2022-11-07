//
//  DummyPhotoDetailViewController.swift
//  PhotoApp
//
//  Created by Muhammad Raza on 07/11/2022.
//

import UIKit

class DummyPhotoDetailViewController: UIViewController {
    
    // MARK: - IBOutlets
    
    @IBOutlet private weak var idLabel: UILabel!
    @IBOutlet private weak var albumIdLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var imageView: UIImageView!
    
    // MARK: - Private properties
    
    private var viewModel: DummyPhotoDetailViewModel
    
    // MARK: - Inits
    
    init(viewModel: DummyPhotoDetailViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "DummyPhotoDetailViewController", bundle: .main)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Lifecycle Methods

    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
        bindViewModel()
        viewModel.viewDidLoad()
    }
    
    // MARK: - Private methods
    
    func setupViews() {
        updateData()
    }
    
    func bindViewModel() {
        viewModel.reloadData = { [weak self] in
            DispatchQueue.main.async {
                self?.updateData()
            }
        }
    }
    
    private func updateData() {
        idLabel.text = viewModel.idText
        albumIdLabel.text = viewModel.albumIdText
        titleLabel.text = viewModel.titleText
        if let url = viewModel.imageURL {
            imageView.loadImage(from: url)
        }
    }
}
