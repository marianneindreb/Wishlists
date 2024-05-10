////
////  ListItemCellView.swift
////  Wishlists
////
////  Created by Marianne Indrebø on 21/04/2024.
////
//
//import SwiftUI
//import Observation
//
//struct ListItemCellView: View {
//    var product: ProductItem
//   
//
//    var body: some View {
//
//            ZStack(alignment: .topTrailing) {
//                HStack {
//                    Rectangle()
//                        .foregroundStyle(Color.gray.opacity(0.1))
//                        .frame(width: 110, height: 170)
//                        .cornerRadius(2)
//
//                    VStack(alignment: .leading) {
//                        Text("Listname")
//                            .font(.title)
//                            .bold()
//                            .padding(.top, 15)
//                        Text(product.productTitle)
//                            .font(.caption)
//
//                        Spacer()
//                    }
//                    .padding(.leading, 10)
//
//                    Spacer()
//                }
//                .padding()
//                .frame(width: 370, height: 200)
//                .background(.white)
//                .cornerRadius(5)
//                .shadow(radius: 20 )
//
//                Button {
//                    // detailview
//                } label: {
//                    Image(systemName: "arrow.right")
//                        .foregroundStyle(.black)
//                }
//                .padding(.top, 20)
//            }
//        }
//    }
//
//#Preview {
//    ListItemCellView(product: ProductItem(image: "", productTitle: "Title", productDescription: "Lorem ipsum"))
//}
