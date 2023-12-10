//
//  ShoppingCartViewModel.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 10/12/23.
//

import Foundation


final class ShoppingCartViewModel {
    
    var products = [Product]()
    var cellIndex = Int()
    
    var imageUrl: String {
        guard let imageUrl = products[cellIndex].image else { return "" }
        return imageUrl
    }
}
