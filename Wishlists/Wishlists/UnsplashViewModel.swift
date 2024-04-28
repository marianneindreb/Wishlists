//
//  UnsplashViewModel.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 28/04/2024.
//

import Foundation
import SwiftUI

final class UnsplashViewModel: ObservableObject {
    @Published var photos: [UnsplashModel] = []
   
    
    init() {}
    
    func fetchSearchResult(_ searchText: String) {
        print("Fetching search result...")
        guard let clientID = ProcessInfo.processInfo.environment["CLIENT_ID"] else {
                   print("Error: CLIENT_ID environment variable is not set.")
                   return
               }
        let urlString = "https://api.unsplash.com/search/photos?query=\(searchText)&client_id=\(clientID)"
        NetworkManager.shared.searchUnsplash(from: urlString) {
            [weak self] result in
                switch result {
                    case .success(let data):
                        do {
                            let unsplashResponse = try JSONDecoder().decode(
                                UnsplashResponse.self,
                                from: data
                            )
                            DispatchQueue.main.async {
                                self?.photos = unsplashResponse.photos
                            }
                        } catch {
                            DispatchQueue.main.async {
                                print("Something went wrong decoding search response for phrase \(searchText)")
                            }
                        }
                    case .failure(let error):
                        print("Something went wrong fetching search response for phrase \(searchText): \(error)")
                }
        }
    }
}
