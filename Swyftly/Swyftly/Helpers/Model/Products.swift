//
//  Products.swift
//  Swyftly
//
//  Created by Amit Thakur on 25/04/2023.
//

import Foundation

struct Product: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    var price: Int
    var category: String
    var image_url: String
    var sku: String
    var ean: UInt64
}


struct Products: Hashable, Codable {
    let products: [Product]
}
