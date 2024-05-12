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
    var productBrand: String
    var storeName: String
    var websiteUrl: String
    var productPrice: String
    
    
    init(imageData: Data? = nil, productTitle: String = "", productDescription: String = "", productBrand: String = "", storeName: String = "", websiteUrl: String = "", productPrice: String = "") {
        self.imageData = imageData
        self.productTitle = productTitle
        self.productDescription = productDescription
        self.productBrand = productBrand
        self.storeName = storeName
        self.websiteUrl = websiteUrl
        self.productPrice = productPrice
    }
}

extension ProductItem {
    static let all: [ProductItem] = [
        ProductItem(imageData: nil, productTitle: "Restorative Hair Mask", productDescription: "Soft, soothed strands in an instant. Packed with proteins, vitamins, fatty acids, and antioxidants, the Restorative Hair Mask delivers lasting moisture to dry, damaged hair.", productBrand: "Act+Acre", storeName: "Revolve", websiteUrl: "https://www.revolve.com/actacre-restorative-hair-mask/dp/ACTC-WU7/?d=F&currency=NOK&countrycode=NO&deeplink=true&gad_source=1&gclid=CjwKCAjwuJ2xBhA3EiwAMVjkVH06PJJXZED-wCokiWgEmxkP5te4iAi2xkC0nPfLvbJL6x767AqsZRoCwJsQAvD_BwE&gclsrc=aw.ds", productPrice: "415 kr")
    ]
}
