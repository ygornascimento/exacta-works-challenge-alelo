//
//  ShoppingCartViewModel.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import Foundation


final class ShoppingCartViewModel {
    
    var products = [CartProduct]()
    var cellIndex = Int()
    
    var imageUrl: String {
        guard let imageUrl = products[cellIndex].productImage else { return "" }
        return imageUrl
    }
    
    var productName: String {
        guard let productName = products[cellIndex].productName else { return "" }
        return productName
    }
    
    var productPrice: String {
        guard let productPrice = products[cellIndex].productPrice else { return "" }
        return productPrice
    }
    
    var quantity: Int {
        return 0
    }
}
