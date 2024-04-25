import SwiftUI
import SwiftData

struct WishListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var list: ListModel
    var product: ProductItem
    
    @State private var showAddNewProduct = false
    @State private var showEditListAlert = false
    @State private var showDeleteActionSheet = false
    @State private var selectedProductsToDelete: [ProductItem] = []
    @State private var showProductsToDelete = false
    
    @State private var newListTitle = ""
    @State private var newListDescription = ""
    
    var body: some View {
        ZStack {
            Color.bg.edgesIgnoringSafeArea(.all)
            VStack {
                Text(list.listDescription)
                Spacer()
                // Refresh the product list by filtering out deleted products
                ProductItemList(list: list)
                    .onAppear {
                        list.listItems.removeAll { item in
                            selectedProductsToDelete.contains(item)
                        }
                    }
            }
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    Button {
                        showAddNewProduct = true
                    } label: {
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
        .navigationTitle(list.listTitle)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Edit List") {
                        showEditListAlert = true
                    }
                    Button("Share List") {
                        // Add sharing functionality
                    }
                    Button("Delete Options", role: .destructive) {
                        showDeleteActionSheet = true
                    }
                } label: {
                    Image(systemName: "ellipsis.circle")
                }
            }
        }
        .sheet(isPresented: $showAddNewProduct) {
            AddNewProductDetailView(list: list)
        }
        .alert("Edit List", isPresented: $showEditListAlert) {
            TextField("New list title", text: $newListTitle)
            TextField("New list description", text: $newListDescription)
            Button("Save") {
                list.listTitle = newListTitle
                list.listDescription = newListDescription
            }
            Button("Cancel", role: .cancel) {}
        }
        .actionSheet(isPresented: $showDeleteActionSheet) {
            ActionSheet(
                title: Text("Delete Options"),
                message: Text("Select what you want to delete"),
                buttons: [
                    .default(Text("Delete Selected Products")) {
                        showProductsToDelete = true
                    },
                    .destructive(Text("Delete List")) {
                        modelContext.delete(list)
                    },
                    .cancel()
                ]
            )
        }
        .sheet(isPresented: $showProductsToDelete) {
            DeleteProductsView(
                products: list.listItems,
                list: list, selectedProducts: $selectedProductsToDelete
            )
        }
    }
}
