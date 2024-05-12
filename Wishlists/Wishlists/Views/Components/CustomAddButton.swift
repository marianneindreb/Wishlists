
import SwiftUI

struct CustomAddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            ZStack {
                Circle()
                    .frame(width: 75)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray.opacity(0.4), radius: 10, x: 0, y: 5)
                Image(systemName: "plus")
                    .font(.system(size: 20))
                    .foregroundStyle(.black)
            }
        }
        .padding(30)
    }
}

