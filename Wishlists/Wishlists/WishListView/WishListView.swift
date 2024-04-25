//
//  WishListView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import SwiftData

struct WishListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var list: ListModel
    var product: ProductItem
    //var products: [ProductItem]
    
    @State private var showAddNewProduct = false
    
    var body: some View {
        
            ZStack{
                Color.bg.edgesIgnoringSafeArea(.all)
                
                VStack {
                    Text("List Description")
                      Spacer()
                    ProductItemList(list: list)
                }
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
                AddNewProductDetailView(list: list)
            })
        }
    }

    
        
        


//#Preview {
//    WishListView()
//}
