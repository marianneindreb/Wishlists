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
    var imageName: String
    var productTitle: String
    var productDescription: String
    
    init(imageName: String = "", productTitle: String = "", productDescription: String = "") {
        self.imageName = imageName
        self.productTitle = productTitle
        self.productDescription = productDescription
    }
}
