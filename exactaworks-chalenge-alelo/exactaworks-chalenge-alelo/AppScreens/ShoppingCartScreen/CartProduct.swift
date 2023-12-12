//
//  CartProduct.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import Foundation

struct CartProduct {
    
    var productName: String?
    var productPrice: String?
    var productImage: String?
    
    init(productName: String? = nil, productPrice: String? = nil, productImage: String? = nil) {
        self.productName = productName
        self.productPrice = productPrice
        self.productImage = productImage
    }
    
}
