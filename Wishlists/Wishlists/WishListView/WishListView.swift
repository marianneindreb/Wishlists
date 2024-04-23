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
    
    @State private var showAddNewProduct = false
    
    var body: some View {
        ZStack{
            ProductCardView(product: product)
            Spacer()
            
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showAddNewProduct = true
                        
                    }label: {
                        ZStack {
                            Circle()
                                .frame(width: 80)
                                .foregroundStyle(.bg)
                                .shadow(radius: 5)
                            Image(systemName: "plus")
                                .foregroundStyle(.black)
                                .font(.subheadline)
                                .fontWeight(.bold)
                            
                        }
                    }
                    .padding()
                }
            }
        }
        .navigationTitle("Wishlist")
        .sheet(isPresented: $showAddNewProduct, content: {
            AddNewProductDetailView()
        })
    }
}
    
        
        


//#Preview {
//    WishListView()
//}
