//
//  ShoppingCartTableViewCell.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import UIKit

final class ShoppingCartTableViewCell: UITableViewCell {
    
    static let cellReuseIdentifier = String(describing: ShoppingCartTableViewCell.self)
    private let cellContainer = ShoppingCartContainerTableViewCell()
    private var viewModel = ShoppingCartViewModel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    override func prepareForReuse() {
    }
    
    func configureWith(viewModel: ShoppingCartViewModel, imageUrl: String) {
        cellContainer.productName.text = viewModel.productName
        cellContainer.productPrice.text = "Preço: \(viewModel.productPrice)"
        DataService.loadImage(
            fromUrl: viewModel.imageUrl) { [weak self] image in
                DispatchQueue.main.async {
                    self?.cellContainer.productImage.image = image
                }
            } onError: { error in
                DispatchQueue.main.async {
                    self.cellContainer.productImage.image = UIImage(named: "placeholder")
                }
            }
    }
    
    private func setupView() {
        contentView.addSubview(cellContainer)
        cellContainer.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.backgroundColor = #colorLiteral(red: 0.9214109778, green: 0.9214110374, blue: 0.9214110374, alpha: 1)

        NSLayoutConstraint.activate([
            cellContainer.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellContainer.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
            cellContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
            cellContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
        ])
    }
}
