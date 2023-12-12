//
//  ShoppingCartContainerTableViewCell.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import UIKit

final class ShoppingCartContainerTableViewCell: UIView {
    
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
        label.text = "VESTIDO TRANSPASSE BOW"
        
        return label
    }()

    private(set) var productPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "R$ 199,90"
        
        return label
    }()
    
    private(set) var productQuantity: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .gray
        label.text = "0"
        
        return label
    }()
    
    private(set) var productIncreaseDecrease: UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 1
        stepper.maximumValue = 10
        
        return stepper
    }()
    
    private(set) lazy var productIncreaseDecreaseStack: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [productQuantity,
                                                   productIncreaseDecrease])
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 4
        stack.alignment = .center
        
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
        addSubview(productImage)
        addSubview(productName)
        addSubview(productPrice)
        addSubview(productIncreaseDecreaseStack)
        
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        
        layer.cornerRadius = 6
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09993948063)
        layer.shadowOpacity = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        
        productImage.translatesAutoresizingMaskIntoConstraints = false
        productName.translatesAutoresizingMaskIntoConstraints = false
        productPrice.translatesAutoresizingMaskIntoConstraints = false
        productIncreaseDecreaseStack.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate ([
            
            productImage.heightAnchor.constraint(equalToConstant: 100),
            productImage.topAnchor.constraint(equalTo: topAnchor),
            productImage.leadingAnchor.constraint(equalTo: leadingAnchor),
            productImage.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            productIncreaseDecreaseStack.widthAnchor.constraint(equalToConstant: 60),
            productIncreaseDecreaseStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productIncreaseDecreaseStack.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
            
            productName.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            productName.leadingAnchor.constraint(equalTo: productImage.trailingAnchor, constant: 16),
            productName.trailingAnchor.constraint(equalTo: productIncreaseDecreaseStack.leadingAnchor, constant: 16),
            
            productPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 16),
            productPrice.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            productPrice.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            productPrice.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        ])
    }
}





