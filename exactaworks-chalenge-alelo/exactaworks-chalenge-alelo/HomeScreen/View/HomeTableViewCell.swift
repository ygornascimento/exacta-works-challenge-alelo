//
//  HomeTableViewCell.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import UIKit

final class HomeTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifier = String(describing: HomeTableViewCell.self)
    private let cellContainer = HomeContainerTableViewCell()
    private var viewModel = HomeScreenViewModel()
    
//    private var downloadTask: DownloadTask?
    private let loadingIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView()
        indicator.color = .black
        indicator.style = .medium
        return indicator
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForReuse() {
//        downloadTask?.cancel()
    }
    
    func configureWith(viewModel: HomeScreenViewModel, imageUrl: String) {
        loadingIndicator.startAnimating()
        cellContainer.productName.text = viewModel.productName
        cellContainer.productPrice.text = viewModel.productPrice
        cellContainer.productPromotionalStatus.text = viewModel.productPromotionalStatus
        cellContainer.productPromotionalPrice.text = viewModel.productPromotionalPrice
        
        var urlComponents = URLComponents(string: imageUrl)
        urlComponents?.scheme = "https"
        guard let httpsImage = urlComponents?.string else { return }
        let finalImageUrl = URL(string: httpsImage)
        
        loadingIndicator.stopAnimating()
    }
    
    private func setupView() {
        contentView.addSubview(cellContainer)
        contentView.addSubview(loadingIndicator)
        loadingIndicator.translatesAutoresizingMaskIntoConstraints = false
        cellContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = #colorLiteral(red: 0.9214109778, green: 0.9214110374, blue: 0.9214110374, alpha: 1)

        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            
            loadingIndicator.centerXAnchor.constraint(equalTo: cellContainer.productImage.centerXAnchor),
            loadingIndicator.centerYAnchor.constraint(equalTo: cellContainer.productImage.centerYAnchor)
        ])
    }
    
    
}
