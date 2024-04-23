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
class ProductItem: Identifiable {
    var image: String
    var productTitle: String
    var productDescription: String
    
    init(image: String, productTitle: String, productDescription: String) {
        self.image = image
        self.productTitle = productTitle
        self.productDescription = productDescription
    }
}
