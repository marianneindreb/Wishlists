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
class ListModel: ObservableObject {
    var listTitle: String
    var listDescription: String
    var listItems: [ProductItem]
    
    init(listTitle: String, listDescription: String, listItems: [ProductItem]) {
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
