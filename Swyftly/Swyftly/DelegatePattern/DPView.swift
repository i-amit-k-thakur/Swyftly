//
//  DPView.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import SwiftUI

struct DPView: View {
    @ObservedObject var viewModel:DPViewModel

    var gridItems = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: gridItems) {
                    ForEach(viewModel.products) { product in
                        DPViewRow(viewModel: DPViewRowViewModel(product: product))
                    }
                }
            }.navigationBarTitle("Recommended for you")
                .font(.custom("Gill Sans Light", size: 20.0))
        }
    }
}

struct DPView_Previews: PreviewProvider {
    static var previews: some View {
        let product1 = Product(id: 1,
                               name: "Product 1",
                               description: "Product 1 description",
                               price: 120,
                               category: "Fruits",
                               image_url: "",
                               sku: "FRU001",
                               ean: 1234567890)
        let product2 = Product(id: 2,
                               name: "Product 2",
                               description: "Product 2 description",
                               price: 150,
                               category: "Drinks",
                               image_url: "",
                               sku: "FRU002",
                               ean: 1234567870)
        DPView(viewModel: DPViewModel(products: [product1, product2]))
    }
}
