import SwiftUI

struct UnsplashSearchView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: UnsplashViewModel
    @State private var searchText = ""
    @Binding var selectedImageData: Data?

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Search Images...", text: $searchText)
                        .padding()
                        .textFieldStyle(.plain)
                    Button {
                        vm.fetchSearchResult(searchText)
                    } label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.black)
                    }
                    .padding()
                }
                .background(Color.bg)
                .cornerRadius(20)
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: [GridItem(), GridItem()]) {
                        ForEach(vm.photos) { photo in
                            AsyncImage(
                                url: URL(string: photo.imageUrl),
                                content: { image in
                                    image.resizable().scaledToFill()
                                },
                                placeholder: { ProgressView() }
                            )
                            .frame(width: 180, height: 250)
                            .cornerRadius(10)
                            .onTapGesture {
                                fetchImageDataAsync(from: photo.imageUrl)
                            }
                        }
                    }
                }
            }
            
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Image("unsplash_logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                }
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
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "checkmark")
                            .foregroundStyle(.black)
                    }
                    .accessibilityLabel("Save")
                }
            }
        }
    }

    private func fetchImageDataAsync(from url: String) {
        NetworkManager.shared.searchUnsplash(from: url) { result in
            DispatchQueue.main.async {
                switch result {
                    case .success(let data):
                    self.selectedImageData = data
                        self.dismiss()
                    case .failure(let error):
                        print("Failed to fetch image data: \(error)")
                }
            }
        }
    }
}
