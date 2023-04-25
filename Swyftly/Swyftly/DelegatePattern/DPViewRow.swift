//
//  DPViewRow.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import SwiftUI

struct DPViewRow: View {
    @ObservedObject var viewModel:DPViewRowViewModel
    
    var body: some View {
        VStack(spacing: 14) {
            productImageSection
            productDetailSection
            
            if viewModel.productAddedToCart == false {
                addToBasketSection
            } else {
                addedToBasketSection
            }
            Spacer()
        }
    }
}


private extension DPViewRow {
    var productImageSection: some View {
        Image(systemName: "photo.fill")
            .resizable()
            .frame(width: 120, height: 120)
            .foregroundColor(.gray)
            .clipShape(Circle())
                        .overlay {
                            Circle().stroke(.gray, lineWidth: 4)
                        }
                        .shadow(radius: 7)
    }
    
    var productDetailSection: some View {
        VStack (alignment: .center, spacing: 8.0){
            Text("\(viewModel.title)")
                .font(.custom("Gill Sans SemiBold", size: 16.0))
            
            Text("\(viewModel.category)")
                .font(.custom("Gill Sans Light", size: 14.0))
                .foregroundColor(.cyan)

            HStack() {
                HStack(spacing: 1.0) {
                    Image(systemName: "sterlingsign.circle.fill")
                        .foregroundColor(.green)
                    Text("\(viewModel.price)")
                        .font(.custom("Gill Sans SemiBold", size: 16.0))
                        .foregroundColor(.green)
                }
                
            }
        }
    }
    
    var addToBasketSection: some View {
        Button(action: {
            viewModel.addToBasket()
        }) {
            Text("Add to basket")
                .frame(minWidth: 0, maxWidth: 100)
                .font(.custom("Gill Sans Bold", size: 13.0))
                .padding()
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2)
                )
        }
        .background(.orange)
        .cornerRadius(8)
    }
    
    var addedToBasketSection: some View {
        Button(action: {
            viewModel.addToBasket()
        }) {
            Text("Remove")
                .frame(minWidth: 0, maxWidth: 100)
                .font(.custom("Gill Sans Bold", size: 13.0))
                .padding()
                .foregroundColor(.white)
                .overlay(RoundedRectangle(cornerRadius: 8)
                            .stroke(Color.white, lineWidth: 2)
                )
        }
        .background(.red)
        .cornerRadius(8)
    }
}

extension DPViewRow: DPViewRowViewModelDelegate {
    func viewModel(_ viewModel:DPViewRowViewModel,
                   addedToCartStateChanged:Bool) {
        if viewModel.productAddedToCart == false {
            addToBasketSection
        } else {
            addedToBasketSection
        }
    }

}

struct DPViewRow_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DPViewRow(viewModel: DPViewRowViewModel(delegate: nil, product: Product(id: 1, name: "Product 1", description: "Product 1 description", price: 120, category: "Fruits", image_url: "", sku: "FRU001", ean: 1234567890)) )
            DPViewRow(viewModel: DPViewRowViewModel(delegate: nil, product: Product(id: 1, name: "Product 2", description: "Product 1 description", price: 150, category: "Fruits", image_url: "", sku: "FRU001", ean: 1234567890)) )
            
        }
        .previewLayout(.fixed(width: 300, height: 70))

    }
}
