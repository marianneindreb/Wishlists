import SwiftUI
import SwiftData

struct ProductItemList: View {
    var list: ListModel
    @Environment(\.modelContext) var modelContext
  

    var body: some View {
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))], spacing: 18) {
                    ForEach(list.listItems) { product in
                        ProductCardView(product: product, list: list)
                    }
                }
                .padding(18)
            }
    }
}
