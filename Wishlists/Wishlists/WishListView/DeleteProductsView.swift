import SwiftUI
import SwiftData

struct DeleteProductsView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    var products: [ProductItem]
    @Bindable var list: ListModel
    @Binding var selectedProducts: [ProductItem]
    @State private var selectedItems = Set<ProductItem>()

    var body: some View {
        NavigationStack {
            List(products) { product in
                HStack {
                    Image(systemName: selectedItems.contains(product) ? "checkmark.circle.fill" : "circle")
                    Text(product.productTitle)
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    if selectedItems.contains(product) {
                        selectedItems.remove(product)
                    } else {
                        selectedItems.insert(product)
                    }
                }
            }
            .navigationTitle("Select Products to Delete")
            .navigationBarItems(
                leading: Button("Cancel") {
                    dismiss()
                },
                trailing: Button("Done") {
                   // modelContext.delete(selectedItems)
                    dismiss()
                }
            )
        }
    }
}
