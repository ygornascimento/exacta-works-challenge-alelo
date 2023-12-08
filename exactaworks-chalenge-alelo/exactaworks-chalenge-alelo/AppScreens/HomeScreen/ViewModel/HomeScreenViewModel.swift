//
//  HomeScreenViewModel.swift
//  exactaworks-chalenge-alelo
//
//  Created by Ygor Nascimento on 07/12/23.
//

import Foundation

struct HomeScreenViewModel {

    var products = [Product]()
    var cellIndex = Int()
    
    var imageUrl: String {
        guard let imageUrl = products[cellIndex].image else { return "" }
        return imageUrl
    }
    
    var productName: String {
        guard let productName = products[cellIndex].name else { return "" }
        return productName
    }
    
    var productPrice: String {
        guard let productPrice = products[cellIndex].regularPrice else { return "" }
        return productPrice
    }
    
    var productPriceInstallments: String {
        guard let productInstallments = products[cellIndex].installments else { return "" }
        return productInstallments
    }
    
    var productPromotionalStatus: String {
        guard let isOnSale = products[cellIndex].onSale else { return "" }
        guard let productPromotionalStatus = products[cellIndex].actualPrice else { return "" }
        if isOnSale {
           return "Produto em PROMOÇÃO!!!"
        } else {
            return "Não há promoção para este produto :("
        }
    }
    
    var productPromotionalPrice: String {
        guard let isOnSale = products[cellIndex].onSale else { return "" }
        guard let productPromotionalPrice = products[cellIndex].actualPrice else { return "" }
        if isOnSale {
           return productPromotionalPrice
        } else {
            return " - "
        }
    }
    
    var availableSize: String {
        var listSizes = String()
        guard let sizes = products[cellIndex].sizes else { return "" }
        
        for size in sizes {
            if size.available ?? false {
                listSizes.append((size.size! + "  " ) as String)
            }
        }
        
        return listSizes
    }
    
    
}
