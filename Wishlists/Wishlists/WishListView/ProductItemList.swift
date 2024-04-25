//
//  ProductItemList.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 25/04/2024.
//

import SwiftUI

struct ProductItemList: View {
    var list: ListModel
    
    var body: some View {
        if !list.listItems.isEmpty {
            ScrollView{
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 18) {
                    ForEach(list.listItems) { product in
                        ProductCardView(product: product, list: list)
                    }
                }
                .padding(18)
            }
            
        } else {
            VStack {
                Spacer()
                Text("No products")
                Spacer()
            }
        }
    }
}

//#Preview {
//    ProductItemList()
//}
