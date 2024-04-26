import SwiftUI
import SwiftData

struct ProductCardView: View {
    @Environment(\.modelContext) var modelContext
    @State private var showDeleteConfirmation = false
    var product: ProductItem
    var list: ListModel

//    private func deleteItem(_ product: ProductItem) {
//        do {
//            modelContext.delete(product)
//            try modelContext.save()
//        } catch {
//            print("Error deleting product")
//        }
//    }
    
    var body: some View {
        VStack {
            if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 160, height: 165)
                    .clipped()
            } else {
                Rectangle()
                    .foregroundStyle(Color.gray.opacity(0.1))
                    .frame(width: 160, height: 165)
            }

            NavigationLink(destination: ProductDetailView(product: product)) {
                HStack {
                    VStack(alignment: .leading) {
                        HStack {
                            Text(product.productTitle)
                                .font(.subheadline)
                                .bold()
                                .foregroundStyle(.black)
                            Spacer()
                            Image(systemName: "arrow.right")
                                .foregroundStyle(.black)
                                .font(.system(size: 12))
                        }
                        Text(product.productBrand)
                            .font(.caption2)
                            .foregroundStyle(.gray)
                    }
                    .padding(.horizontal, 5)
                }
            }
            
            Spacer()
        }
        .onLongPressGesture {
            showDeleteConfirmation = true
            print("longpressed \(product.productTitle)")
        }
        .confirmationDialog(
            "Are you sure you want to delete \(product.productTitle)?",
                    isPresented: $showDeleteConfirmation,
                    titleVisibility: .visible
                ) {
                    Button("Delete", role: .destructive) {
                        modelContext.delete(product)
                      //  deleteItem(product)
                        do {
                            try modelContext.save()
                        } catch {
                            print("Error saving")
                        }
                        
                    }
                    Button("Cancel", role: .cancel) {}
                }
        .frame(width: 160, height: 220)
        .background(.white)
        .cornerRadius(5)
        .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
    }
}
