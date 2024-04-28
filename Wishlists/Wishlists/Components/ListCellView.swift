import SwiftUI

struct ListCellView: View {
    var list: ListModel
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(alignment: .leading) {
                HStack{
                    Text(list.listTitle)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(.black)
                       
                    Spacer()
                    Image(systemName: "arrow.right")
                        .font(.system(size: 14))
                        .foregroundStyle(.black)
                }
                Text(list.listDescription)
                    .font(.caption)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                HStack() {
                    ForEach(0..<4, id: \.self) { index in
                        if index < list.listItems.count, let imageData = list.listItems[index].imageData, let uiImage = UIImage(data: imageData) {
                            Image(uiImage: uiImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                        } else {
                            Rectangle()
                                .foregroundColor(Color.gray.opacity(0.1))
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                        }
                    }
//                    .onDelete { (indexSet) in
//                        self.list.listItems.remove(atOffsets: indexSet)
//                    }
                }
                
                Spacer()
            }
            .padding()
            .frame(width: 350, height: 130)
            .background(.white)
            .cornerRadius(5)
            .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
            

        }
    }
}
