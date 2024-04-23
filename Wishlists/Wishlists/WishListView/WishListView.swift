//
//  WishListView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import SwiftData

struct WishListView: View {
    var list: ListModel
    var product: ProductItem
    
    var body: some View {
        NavigationStack {
           ProductCardView(product: product)
            }
        }
    }

    
        
        


//#Preview {
//    WishListView()
//}
