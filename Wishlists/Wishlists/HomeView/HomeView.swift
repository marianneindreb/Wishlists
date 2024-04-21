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
    
    private func addList() {
        withAnimation {
            let newList = ListModel()
            modelContext.insert(newList)
        }
    }
    
    var body: some View {
        NavigationStack {
           
                ZStack {
                    Color.bg.edgesIgnoringSafeArea(.all)
                    ScrollView {
                        ForEach(lists) { list in
                            NavigationLink {
                                WishListView(list: list)
                            } label: {
                                ListCellView(list: list)
                            }
                            .padding(5)
                        }
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
                                        .frame(width: 100)
                                        .foregroundStyle(.bg)
                                        .shadow(radius: 5)
                                    Image(systemName: "plus")
                                        .foregroundStyle(.black)
                                        .font(.title)
                                        .fontWeight(.bold)
                                       
                                }
                            }
                            .padding()
                           
                        }
                    }
                    .navigationTitle("WishLists")
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


#Preview {
    HomeView()
        .modelContainer(for: ListModel.self, inMemory: true)
}
