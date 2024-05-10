import SwiftUI
import SwiftData

struct ProductDetailView: View {
    @Bindable var product: ProductItem
    @Environment(\.dismiss) var dismiss
    let websiteUrl: String?
    
    var productImage: Image? {
        if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
            return Image(uiImage: uiImage)
        }
        return nil
    }
    
    var body: some View {
        ScrollView {
            if let productImage = productImage{
                productImage
                    .resizable()
                    .scaledToFill()
                    .frame(width: UIScreen.main.bounds.width, height: 500)
                    .clipped()
            } else {
                Rectangle()
                    .foregroundColor(Color.gray.opacity(0.1))
                    .frame(width: UIScreen.main.bounds.width, height: 500)
            }
            VStack(alignment: .leading) {
                HStack {
                    Text(product.productTitle)
                        .font(.headline)
                        .bold()
                    Spacer()
                    ShareLink(
                        item: product.websiteUrl,
                        preview: SharePreview(
                            Text(product.productTitle),
                            image: productImage ?? Image(systemName: "photo")
                        )
                    ) {
                        Image(systemName: "square.and.arrow.up")
                            .font(.system(size: 18))
                            .foregroundColor(.black)
                    }
                }
                
                Text(product.productBrand)
                    .font(.caption)
                    .foregroundStyle(.gray)
                    .padding(.bottom, 8)
                Text(product.productDescription)
                    .font(.caption)
                    .padding(.bottom, 18)
                Text(product.productPrice)
                    .font(.caption)
                    .bold()
                    .padding(.bottom, 18)
                Text(product.storeName)
                    .font(.caption)
                    .padding(.bottom, 1)
                
                if let websiteUrl = websiteUrl, !websiteUrl.isEmpty {
                    if let url = URL(string: websiteUrl), UIApplication.shared.canOpenURL(url) {
                        Text(websiteUrl)
                            .font(.footnote)
                            .underline()
                            .onTapGesture {
                                UIApplication.shared.open(url)
                            }
                    } else {
                        Text("Invalid website URL")
                            .font(.caption)
                            .foregroundColor(.red)
                    }
                }
            }
            .padding(20)
        }
        .ignoresSafeArea()
        .navigationBarBackButtonHidden(true)
        
        .toolbar {
            ToolbarItem(placement: .topBarLeading) {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "arrow.backward.circle.fill")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .font(.system(size: 26))
                }
                .accessibilityLabel("go back")
            }
        }
    }
}


//#Preview {
//    do {
//        let config = ModelConfiguration(isStoredInMemoryOnly: true)
//        let container = try ModelContainer(for: ProductItem.self, configurations: config)
//        let example = ProductItem(imageData: nil, productTitle: "Restorative Hair Mask", productDescription: "Soft, soothed strands in an instant. Packed with proteins, vitamins, fatty acids, and antioxidants, the Restorative Hair Mask delivers lasting moisture to dry, damaged hair.", productBrand: "Act+Acre", storeName: "Revolve", websiteUrl: "https://www.revolve.com/actacre-restorative-hair-mask/dp/ACTC-WU7/?d=F&currency=NOK&countrycode=NO&deeplink=true&gad_source=1&gclid=CjwKCAjwuJ2xBhA3EiwAMVjkVH06PJJXZED-wCokiWgEmxkP5te4iAi2xkC0nPfLvbJL6x767AqsZRoCwJsQAvD_BwE&gclsrc=aw.ds", productPrice: "415 kr")
//        return ProductDetailView(product: example)
//            .modelContainer(container)
//    } catch {
//        fatalError("Failed to create model container")
//    }
//}
