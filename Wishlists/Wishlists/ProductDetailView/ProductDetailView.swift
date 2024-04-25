//
//  ProductDetailView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import SwiftData

struct ProductDetailView: View {
    @Bindable var product: ProductItem
    
    var body: some View {
        VStack{
            GeometryReader { reader in
                if let imageData = product.imageData, let uiImage = UIImage(data: imageData) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .scaledToFill()
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 390 : 300)
                } else {
                    Rectangle()
                        .foregroundStyle(.bg)
                        .offset(y: -reader.frame(in: .global).minY)
                        .frame(width: UIScreen.main.bounds.width, height: reader.frame(in: .global).minY > 0 ? reader.frame(in: .global).minY + 390 : 300)
                }
            }
            
            VStack (alignment: .leading){
                HStack{
                    Text(product.productTitle)
                        .bold()
                    Spacer()
                    Text(product.productPrice)
                        .bold()
                }
                Text(product.productBrand)
                    .font(.caption)
                    .padding(.bottom)
                Text(product.productDescription)
                    .padding(.bottom)
                Text(product.storeName)
                Text(product.websiteUrl)
                    .font(.footnote)
                    .padding(.bottom)
                
            }
            .padding(30)
        }
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: ProductItem.self, configurations: config)
        let example = ProductItem(imageData: nil, productTitle: "Restorative Hair Mask", productDescription: "Soft, soothed strands in an instant. Packed with proteins, vitamins, fatty acids, and antioxidants, the Restorative Hair Mask delivers lasting moisture to dry, damaged hair.", productBrand: "Act+Acre", storeName: "Revolve", websiteUrl: "https://www.revolve.com/actacre-restorative-hair-mask/dp/ACTC-WU7/?d=F&currency=NOK&countrycode=NO&deeplink=true&gad_source=1&gclid=CjwKCAjwuJ2xBhA3EiwAMVjkVH06PJJXZED-wCokiWgEmxkP5te4iAi2xkC0nPfLvbJL6x767AqsZRoCwJsQAvD_BwE&gclsrc=aw.ds", productPrice: "415 kr")
        return ProductDetailView(product: example)
            .modelContainer(container)
    } catch {
        fatalError("Failed to create model container")
    }
}
