//
//  HomeContainerTableViewCell.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import UIKit

final class HomeContainerTableViewCell: UIView {
    
    private(set) var productImage: UIImageView = {
        let image = UIImage(named: "carPlaceHolder")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return imageView
    }()
    
    private(set) var productName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private(set) var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private(set) var productPromotionalStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private(set) var productPromotionalPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private(set) var availableSize: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 1
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private(set) lazy var productDescriptionStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productName,
                                                   productPrice,
                                                   productPromotionalStatus,
                                                   productPromotionalPrice,
                                                   availableSize])
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 6
        stack.alignment = .leading
        
        return stack
    }()
    
    private(set) lazy var productStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productImage,
                                                   productDescriptionStack])
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.spacing = 6
        stack.alignment = .leading
        
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainerView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContainerView()
    }
    
    private func setupContainerView() {
        addSubview(productStack)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = 6
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09993948063)
        layer.shadowOpacity = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        
        productStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            productStack.topAnchor.constraint(equalTo: topAnchor),
            productStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            productStack.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
}
