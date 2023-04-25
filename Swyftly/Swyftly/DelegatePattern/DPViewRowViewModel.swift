//
//  DPViewRowViewModel.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import Foundation
import Combine

protocol DPViewRowViewModelDelegate {
    func viewModel(_ viewModel:DPViewRowViewModel, addedToCartStateChanged:Bool)
}

class DPViewRowViewModel: ObservableObject {
    var delegate: DPViewRowViewModelDelegate?
    private let product:Product
    
    @Published var productAddedToCart = false
    
    init(delegate: DPViewRowViewModelDelegate? = nil, product: Product) {
        self.delegate = delegate
        self.product = product
    }
    
    var title: String {
        return product.name
    }
    
    var description: String {
        return product.description
    }
    
    var category: String {
        return product.category
    }
    
    var price: String {
        let pounds = Double(Double(product.price)/100)
        return String(format: "%.2f", pounds)
    }
    
    var cartStatus: String {
        return "Not added to cart"
    }
    
}

extension DPViewRowViewModel {
    func addToBasket() {
        productAddedToCart = !productAddedToCart
        if let delegate = self.delegate {
            delegate.viewModel(self, addedToCartStateChanged: productAddedToCart)
        }
    }
}
