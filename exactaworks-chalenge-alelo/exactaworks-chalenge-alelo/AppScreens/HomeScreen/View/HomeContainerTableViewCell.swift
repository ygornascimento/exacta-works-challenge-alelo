//
//  HomeContainerTableViewCell.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import UIKit

final class HomeContainerTableViewCell: UIView {
    
    var delegate: AddToCartDelegate?
    
    private(set) var productImage: UIImageView = {
        let image = UIImage(named: "image_test")
        let imageView = UIImageView(image: image)
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = false
        imageView.layer.cornerRadius = 6
        imageView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        
        return imageView
    }()
    
    private(set) var productName: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        
        return label
    }()
    
    private(set) var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private(set) var installmentsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private(set) var productPromotionalStatus: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private(set) var productPromotionalPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    
    private(set) var availableSize: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        
        return label
    }()
    
    private(set) var addToCartButton: UIButton = {
        let button = UIButton()
        button.setTitle("Adicionar ao carrinho", for: .normal)
        button.backgroundColor = .systemGray
        button.setTitleColor(UIColor.black, for: .normal)
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        
        return button
    }()
    
    private(set) lazy var productStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productName,
                                                   productPrice,
                                                   productPromotionalStatus,
                                                   productPromotionalPrice,
                                                   availableSize])
        stack.setCustomSpacing(4, after: productName)
        stack.axis = .vertical
        stack.distribution = .fillProportionally
        stack.spacing = 0
        stack.alignment = .leading
        
        return stack
    }()
    
    @objc func buttonTapped(sender : UIButton) {
        delegate?.didTapAddToCart()
//        print("Testandoo.....")
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContainerView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupContainerView()
    }
    
    private func setupContainerView() {
        addSubview(productImage)
        addSubview(productStack)
        addSubview(addToCartButton)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = 6
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09993948063)
        layer.shadowOpacity = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        
        addToCartButton.layer.cornerRadius = 6
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productStack.translatesAutoresizingMaskIntoConstraints = false
        addToCartButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            productImage.heightAnchor.constraint(equalToConstant: 450),
            productImage.topAnchor.constraint(equalTo: topAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            productStack.topAnchor.constraint(equalTo: productImage.bottomAnchor, constant: 8),
            productStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            addToCartButton.topAnchor.constraint(equalTo: productStack.bottomAnchor, constant: 16),
            addToCartButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            addToCartButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            addToCartButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
        ])
    }
}
