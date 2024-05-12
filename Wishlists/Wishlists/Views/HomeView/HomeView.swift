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
                
                VStack{
                    if !lists.isEmpty{
                        ScrollView(showsIndicators: false) {
                            ForEach(lists) { list in
                                NavigationLink(destination: WishListView(list: list, product: product, wishlist: [product])) {
                                    ListCellView(list: list)
                                }
                                .padding(5)
                            }
                        }
                    } else {
                        Text("Add new list to get started")
                    }
                }
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        CustomAddButton {
                            showAlert = true
                        }
                        .accessibilityLabel("Button to add new list")
                        .alert("Add New List", isPresented: $showAlert) {
                            TextField("Title", text: $newListTitle)
                            
                            TextField("Description", text: $newListDescription)
                            Button("Add") {
                                addList()
                                newListTitle = ""
                                newListDescription = ""
                            }
                            Button("Cancel", role: .cancel) {}
                        }
                    }
                    .navigationTitle("Wishlists")
                    .toolbarTitleDisplayMode(.automatic)
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

