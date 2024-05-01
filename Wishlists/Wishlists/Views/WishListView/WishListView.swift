import SwiftUI
import SwiftData

struct WishListView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var list: ListModel
    var product: ProductItem
    
    @State private var showAddNewProduct = false
    @State private var showEditListAlert = false
    @State private var showDeleteActionSheet = false
    
    @State private var newListTitle = ""
    @State private var newListDescription = ""
    var wishlist: [ProductItem]
    
    var body: some View {
        ZStack {
            Color.bg.edgesIgnoringSafeArea(.all)
            
            VStack {
                if !list.listItems.isEmpty{
                    ProductItemList(list: list)
                } else {
                    Spacer()
                    Text("No products added")
                    Spacer()
                }
                Spacer()
            }
            Spacer()
            VStack {
                Spacer()
                HStack {
                    Spacer()
                    CustomAddButton {
                        showAddNewProduct = true
                    }
                    .accessibilityLabel("Button to add new product")
                }
            }
        }
        
        .navigationTitle(list.listTitle)
        .navigationBarBackButtonHidden(true)
        .sheet(isPresented: $showAddNewProduct, content: {
            AddNewProductDetailView(list: list)
        })
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(list.listDescription)
                    .font(.subheadline)
            }
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.black)
                }
                .accessibilityLabel("go back to previous")
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Menu {
                    Button("Edit List") {
                        showEditListAlert = true
                    }
                    .accessibilityLabel("Edit list")
                    Button("Delete List", role: .destructive) {
                        showDeleteActionSheet = true
                    }
                    .accessibilityLabel("Delete list")
                } label: {
                    Image(systemName: "ellipsis")
                        .foregroundStyle(.black)
                }
                .accessibilityLabel("Menu to edit or delete list")
            }
        }
        .sheet(isPresented: $showAddNewProduct) {
            AddNewProductDetailView(list: list)
        }
        .alert("Edit List", isPresented: $showEditListAlert) {
            TextField("New title", text: $newListTitle)
            TextField("New description", text: $newListDescription)
            Button("Save") {
                list.listTitle = newListTitle
                list.listDescription = newListDescription
            }
            Button("Cancel", role: .cancel) {}
        }
        .confirmationDialog(
            "Do you really want to delete this list?",
            isPresented: $showDeleteActionSheet,
            titleVisibility: .visible
        ) {
            Button("Delete list", role: .destructive) {
                modelContext.delete(list)
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("This will permanently remove all items. You can long press a product to delete it individually.")
        }
    }
}
