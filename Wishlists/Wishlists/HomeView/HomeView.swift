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
    @State var showAlert = false
    @State private var newListTitle = ""
    @State private var newListDescription = ""

    private func addList() {
        withAnimation {
            let newList = ListModel(listTitle: newListTitle, listDescription: newListDescription)
            modelContext.insert(newList)
        }
    }

    private func deleteList(offsets: IndexSet) {
        offsets.forEach { index in
            modelContext.delete(lists[index])
        }
    }

    var body: some View {
        NavigationView {
            ZStack {
                Color.bg.edgesIgnoringSafeArea(.all)
                ScrollView(showsIndicators: false) {
                    ForEach(lists) { list in
                        NavigationLink(destination: WishListView(list: list, product: product)) {
                            ListCellView(list: list)
                        }
                        .padding(5)
                    }
                }

                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button {
                            showAlert = true
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
                        .alert("Add New List", isPresented: $showAlert) {
                            TextField("List Title", text: $newListTitle)
                                
                            TextField("List Description", text: $newListDescription)
                            Button("Add") {
                                addList()
                                newListTitle = ""
                                newListDescription = ""
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                    }
                    .navigationTitle("My Wishlists")
                }
            }
        }
    }
}

    
    //#Preview {
    //    HomeView(list: list)
    //        .modelContainer(for: ListModel.self, inMemory: true)
    //}

