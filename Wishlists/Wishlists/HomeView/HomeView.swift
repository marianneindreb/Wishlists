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
                                    .frame(width: 90)
                                    .foregroundStyle(.white)
                                    .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                                Image(systemName: "plus")
                                    .font(.system(size: 18))
                                    .foregroundStyle(.black)
                                    
                            }
                        }
                        .padding(30)
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
                    .navigationTitle("Wants")
                    .toolbar {
                        ToolbarItem(placement: .principal) {
                            Image("logo")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 24)
                        }
                    }
                }
            }
        }
    }
}

    
    //#Preview {
    //    HomeView(list: list)
    //        .modelContainer(for: ListModel.self, inMemory: true)
    //}

