//
//  ListModel.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import Foundation
import SwiftData
import SwiftUI

@Model
class ListModel: ObservableObject, Identifiable {
    var id = UUID()
    var listTitle: String
    var listDescription: String
    var listItems: [ProductItem]
    
    init(listTitle: String = "List Title", listDescription: String = "List description", listItems: [ProductItem] = []) {
        self.listTitle = listTitle
        self.listDescription = listDescription
        self.listItems = listItems
    }
    }

@Model
class ProductItem: ObservableObject, Identifiable {
    var imageData: Data?
    var productTitle: String
    var productDescription: String
    var storeName: String
    var websiteUrl: String
    var productPrice: String
    
    
    init(imageData: Data? = nil, productTitle: String = "", productDescription: String = "", storeName: String = "", websiteUrl: String = "", productPrice: String = "") {
        self.imageData = imageData
        self.productTitle = productTitle
        self.productDescription = productDescription
        self.storeName = storeName
        self.websiteUrl = websiteUrl
        self.productPrice = productPrice
    }
}
