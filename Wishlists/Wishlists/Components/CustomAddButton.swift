//
//  CustomAddButton.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 27/04/2024.
//

import SwiftUI

struct CustomAddButton: View {
    var action: () -> Void
    
    var body: some View {
        Button (action: action){
            ZStack {
                Circle()
                    .frame(width: 90)
                    .foregroundStyle(.white)
                    .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                Image(systemName: "plus")
                    .font(.system(size: 18))
                    .foregroundStyle(.black)
                    
            }
            .padding()
        }
        .padding(30)
    }
}

