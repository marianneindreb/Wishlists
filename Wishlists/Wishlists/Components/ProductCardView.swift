//
//  ListItemCellView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import Observation

struct ProductCardView: View {
    var product: ProductItem
    
    var body: some View {
        VStack {
            Rectangle()
                .foregroundStyle(Color.gray.opacity(0.1))
                .frame(width: 185, height: 190)
                .cornerRadius(2)
            Spacer()
            HStack {
                VStack(alignment: .leading) {
                    Text("Restorative Hair mask")
                        .font(.subheadline)
                        .bold()
                    Text("Act+Acre")
                        .font(.caption)
                        .foregroundStyle(.gray)
                }
                .frame(width: 150)
                Spacer()
                Button {
                    // detailview
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.black)
                }
            }
            Spacer()
                .padding(10)
        }
        .frame(width: 185, height: 260)
        .background(.white)
        .cornerRadius(5)
        .shadow(radius: 20 )
    }
}


//#Preview {
//    ListItemCellView(product: ProductItem(imageName: "", productTitle: "Title", productDescription: "Lorem ipsum"))
//        .modelContainer(for: ListModel.self, inMemory: true)
//}
