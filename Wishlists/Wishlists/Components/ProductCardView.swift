

import SwiftUI
import SwiftData

struct ProductCardView: View {
    var product: ProductItem
    var list: ListModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
       
            VStack {
                if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 160, height: 165)
                
                } else {
                    Rectangle()
                        .foregroundStyle(Color.gray.opacity(0.1))
                        .frame(width: 160, height: 165)
                }
   
           //     Spacer()
                HStack {
                    VStack(alignment: .leading) {
                        Text("product.productTitle")
                            .font(.caption)
                            .bold()
                            .foregroundStyle(.black)
                        Text(product.productBrand)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    .frame(width: 130)
                    Spacer()
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        Image(systemName: "arrow.right")
                            .foregroundStyle(.black)
                    }
                }
                    .padding(2)
                Spacer()
            }
            .frame(width: 160, height: 220)
            .background(.white)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
        }
    }



//#Preview {
//    ProductCardView(product: ProductItem(imageData: nil, productTitle: "Title", productDescription: "Lorem ipsum"))
//        .modelContainer(for: ListModel.self, inMemory: true)
//}
