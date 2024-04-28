//
//  SplashScreenView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 26/04/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    
    var body: some View {
        if isActive {
            HomeView()
        } else {
            ZStack{
                Color.bg.edgesIgnoringSafeArea(.all)
                VStack{
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200)
                    
                }
                .scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
            }
            .onAppear{
                DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                    withAnimation{
                        self.isActive = true
                    }
                }
            }
        }
    }
}

#Preview {
    SplashScreenView()
}