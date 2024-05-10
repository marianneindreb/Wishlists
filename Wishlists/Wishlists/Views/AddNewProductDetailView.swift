import SwiftUI
import SwiftData
import PhotosUI


struct AddNewProductDetailView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) var modelContext
    @ObservedObject var vm = UnsplashViewModel()
    var list: ListModel
    
    @State private var searchText = ""
    @State private var showUnsplashSheet = false
    @State private var unsplashImageData: Data?
    @State private var selectedImage: PhotosPickerItem?
    @State private var imageData: Data?
    @State private var productTitle: String = ""
    @State private var productDescription: String = ""
    @State private var productBrand: String = ""
    @State private var storeName: String = ""
    @State private var websiteUrl: String = ""
    @State private var productPrice: String = ""
    
    func saveProduct() {
        let newProduct = ProductItem(
            imageData: unsplashImageData ?? imageData,
            productTitle: productTitle,
            productDescription: productDescription,
            productBrand: productBrand,
            storeName: storeName,
            websiteUrl: websiteUrl,
            productPrice: productPrice
        )
        list.listItems.append(newProduct)
        modelContext.insert(newProduct)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.bg.edgesIgnoringSafeArea(.all)
                Form {
                    if let uiImage = (unsplashImageData ?? imageData).flatMap({ UIImage(data: $0) }) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 300)
                    }
                    Section(header: Text("Add Photo From")) {
                        HStack {
                            PhotosPicker(selection: $selectedImage, matching: .images, photoLibrary: .shared()) {
                                Label("Photo library", systemImage: "photo")
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Button {
                                showUnsplashSheet = true
                            } label: {
                                Label("Unsplash", systemImage: "photo")
                                    .foregroundColor(.gray)
                            }
                            .sheet(isPresented: $showUnsplashSheet) {
                                UnsplashSearchView(vm: vm, selectedImageData: $unsplashImageData)
                            }
                        }
                        .buttonStyle(BorderlessButtonStyle())
                    }
                    
                    Section(header: Text("Name / title")) {
                        TextField("", text: $productTitle)
                    }
                    Section(header: Text("Productname")) {
                        TextField("", text: $productBrand)
                    }
                    
                    Section(header: Text("Description")) {
                        TextField("", text: $productDescription, axis: .vertical)
                    }
                    
                    Section(header: Text("Storename")) {
                        TextField("", text: $storeName)
                    }
                    
                    Section(header: Text("Website / Link")) {
                        TextField("", text: $websiteUrl, axis: .vertical)
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
                            Image(systemName: "xmark")
                                .foregroundStyle(.black)
                        }
                        .accessibilityLabel("Dismiss")
                    }
                    ToolbarItem(placement: .topBarTrailing) {
                        let buttonDisabled = productTitle.isEmpty
                        Button {
                            if !buttonDisabled {
                                saveProduct()
                                dismiss()
                            }
                        } label: {
                            Image(systemName: "checkmark")
                                .foregroundStyle(.black)
                                .opacity(buttonDisabled ? 0.2 : 1.0)
                        }
                        .accessibilityLabel("Save")
                        .disabled(buttonDisabled)
                    }
                }
                .task(id: selectedImage) {
                    if let data = try? await selectedImage?.loadTransferable(type: Data.self) {
                        imageData = data
                    }
                }
                .navigationTitle("Add new product")
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}



//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: ProductItem.self, configurations: config)
//        let example = ProductItem(imageData: nil, productTitle: "", productDescription: "", productBrand: "", storeName: "", websiteUrl: "", productPrice: "" )
//        return AddNewProductDetailView(product: example)
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container")
//    }
//}
