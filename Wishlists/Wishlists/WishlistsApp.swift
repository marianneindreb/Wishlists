//
//  WishlistsApp.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import SwiftData

@main
struct WishlistsApp: App {
    var body: some Scene {
        WindowGroup {
            SplashScreenView()
        }
        .modelContainer(for: ListModel.self)
    }
}
