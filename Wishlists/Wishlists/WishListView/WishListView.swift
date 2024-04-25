import SwiftUI
import SwiftData

struct WishListView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var list: ListModel
    var product: ProductItem
    
    @State private var showAddNewProduct = false
    @State private var showEditListAlert = false
    @State private var showDeleteActionSheet = false
    
    @State private var newListTitle = ""
    @State private var newListDescription = ""
    
    var body: some View {
        ZStack {
            Color.bg.edgesIgnoringSafeArea(.all)
            VStack(alignment: .leading) {
                Text(list.listDescription)
                    .padding(.leading, 18)
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
                    Button("Delete List", role: .destructive) {
                        showDeleteActionSheet = true
                    }
                } label: {
                    ZStack {
                        Circle()
                            .foregroundStyle(.white)
                            .frame(width: 60)
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.black)
                    }
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
        .confirmationDialog(
            "Delete List",
            isPresented: $showDeleteActionSheet,
            titleVisibility: .visible
        ) {
            Button("Delete List", role: .destructive) {
                modelContext.delete(list)
            }
            Button("Cancel", role: .cancel) {}
        } message: {
            Text("Only want to delete a product? Long press on the product to delete")
        }
    }
}
