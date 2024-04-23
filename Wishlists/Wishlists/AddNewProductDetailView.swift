import SwiftUI
import SwiftData
import PhotosUI

struct AddNewProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    
    @State var product = ProductItem()
    @State private var selectedImage: PhotosPickerItem?
    
    @State private var productName: String = ""
    @State private var productDescription: String = ""
    @State private var storeName: String = ""
    @State private var websiteUrl: String = ""
    @State private var productPrice: String = ""
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bg.edgesIgnoringSafeArea(.all)
                Form {
                    if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    
                    Section(header: Text("Photo")) {
                        PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                            Label("+ Add Photo", systemImage: "photo")
                                .foregroundColor(.gray)
                        }
                    }
                    
                    Section(header: Text("Name")) {
                        TextField("", text: $productName)
                    }
                    
                    Section(header: Text("Description")) {
                        TextField("", text: $productDescription)
                    }
                    
                    Section(header: Text("Store Name")) {
                        TextField("", text: $storeName)
                    }
                    
                    Section(header: Text("Website / Link")) {
                        TextField("", text: $websiteUrl)
                    }
                    
                    Section(header: Text("Price")) {
                        TextField("", text: $productPrice)
                    }
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button {
                            dismiss()
                        } label: {
                            Label("Cancel", systemImage: "xmark")
                                .labelStyle(.iconOnly)
                        }
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button{
                            // saveProduct()
                            dismiss()
                        } label: {
                            Label("Save", systemImage: "checkmark")
                                .labelStyle(.iconOnly)
                        }
                        .disabled(productName.isEmpty)
                    }
                }
                .task(id: selectedImage) {
                    if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                        product.imageData = data
                    }
                }
                .navigationTitle("Add new product")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ProductItem.self, configurations: config)
        let example = ProductItem(imageData: nil, productTitle: "", productDescription: "", storeName: "", websiteUrl: "", productPrice: "" )
        return AddNewProductDetailView(product: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
