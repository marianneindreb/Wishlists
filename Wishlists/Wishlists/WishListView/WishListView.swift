import SwiftUI
import SwiftData

struct WishListView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    @Bindable var list: ListModel
    var product: ProductItem
    //var products: [ProductItem]
    
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
                
                VStack {
                    Spacer()
                    Button {
                        showAddNewProduct = true
                    } label: {
                        ZStack {
                            Circle()
                                .frame(width: 90)
                                .foregroundStyle(.white)
                                .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                            Image(systemName: "plus")
                                .font(.system(size: 18))
                                .foregroundStyle(.black)
                                
                        }
                        .padding()
                    }
                    .padding(30)
                }
            }
            .navigationTitle("Wishlist")
            .sheet(isPresented: $showAddNewProduct, content: {
                AddNewProductDetailView(list: list)
            })
        }
        
        .navigationTitle(list.listTitle)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.left")
                        .foregroundStyle(.black)
                }
            }
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
                   
                       
                        Image(systemName: "ellipsis")
                            .foregroundStyle(.black)
                    
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
