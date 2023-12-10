//
//  ShoppingCartSumUpView.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import UIKit

final class ShoppingCartSumUpView: UIView {
    
    private(set) var totalPrice: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = .gray
        label.text = "Total a pagar: "
        label.textAlignment = .center
        
        return label
    }()
    
    private(set) var buyButton: UIButton = {
        let button = UIButton()
        button.setTitle("Efetuar Compra!", for: .normal)
        button.backgroundColor = .systemGray
        button.setTitleColor(UIColor.black, for: .normal)
        
        return button
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
        addSubview(totalPrice)
        addSubview(buyButton)
        
        backgroundColor = #colorLiteral(red: 0.9214109778, green: 0.9214110374, blue: 0.9214110374, alpha: 1)
        layer.cornerRadius = 6
        layer.shadowColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.09993948063)
        layer.shadowOpacity = 4
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowRadius = 6
        
        buyButton.layer.cornerRadius = 6
        
        totalPrice.translatesAutoresizingMaskIntoConstraints = false
        buyButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            
            totalPrice.topAnchor.constraint(equalTo: topAnchor, constant: 32),
            totalPrice.leadingAnchor.constraint(equalTo: leadingAnchor),
            totalPrice.trailingAnchor.constraint(equalTo: trailingAnchor),
            
//            buyButton.topAnchor.constraint(equalTo: totalPrice.bottomAnchor, constant: 32),
            buyButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            buyButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            buyButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -48)
            
        ])
    }
}
