//
//  DPViewModel.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import Foundation
import Combine

protocol DPViewModelDelegate: AnyObject {
    func viewModel(_ viewModel:DPViewModel, didUpdateMessage message:String)
}

class DPViewModel: ObservableObject {
    @Published var products:[Product] = []
    
    init(products: [Product]) {
        self.products = products
    }
    
}
