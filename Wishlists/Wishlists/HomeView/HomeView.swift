//
//  ContentView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import SwiftData

struct HomeView: View {
    @Environment(\.modelContext) var modelContext
    @Query var lists: [ListModel]
    
   @StateObject var product = ProductItem()
    //@StateObject var list = ListModel()
   // @Query var products: [ProductItem]
    @StateObject var list = ListModel()
   // @StateObject var vm = WishListViewModel()
    
    private func addList() {
        withAnimation {
            let newList = ListModel()
            modelContext.insert(newList)
        }
    }
    
//    private func deleteList(offsets: IndexSet) {
//        offsets.forEach { index in
//            modelContext.delete(list[index])
//        }
//    }
    
    var body: some View {
        NavigationStack {
           
                ZStack {
                    Color.bg.edgesIgnoringSafeArea(.all)
                    ScrollView(showsIndicators: false) {
                        ForEach(lists) { list in
                            NavigationLink {
                                WishListView(list: list, product: product)
                            } label: {
                                ListCellView(list: list, product: product)
                            }
                            .padding(5)
                        }
                       // .onDelete(perform: deleteList)
                    }
                    
                    Spacer()
                    
                    VStack {
                        Spacer()
                        HStack {
                            Spacer()
                            Button {
                                addList()
                                
                            }label: {
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
                    .navigationTitle($list.listTitle)
                }
                //            NavigationLink(destination: NewListDetailView()) {
                //                ZStack {
                //                    Circle()
                //                        .frame(width: 100)
                //                        .foregroundStyle(.gray)
                //                    Image(systemName: "plus")
                //                        .foregroundStyle(.white)
                //                        .font(.title)
                //                        .fontWeight(.bold)
                //                        .shadow(radius: 5)
                //                }
                //                .padding(.leading, 200)
                //            }
            }
        }
    }


//#Preview {
//    HomeView(list: list)
//        .modelContainer(for: ListModel.self, inMemory: true)
//}
