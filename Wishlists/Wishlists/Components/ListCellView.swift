//
//  ListCellView.swift
//  Wishlists
//
//  Created by Marianne Indrebø on 21/04/2024.
//

import SwiftUI
import Observation

struct ListCellView: View {
    @Environment(\.modelContext) var modelContext
   // var product: ProductItem
    var list = ListModel()
    
    var body: some View {
            ZStack(alignment: .topTrailing) {
                    VStack(alignment: .leading) {
                        Text(list.listTitle)
                            .font(.subheadline)
                            .foregroundStyle(.black)
                            .bold()
                            .padding(.top, 15)
                        Text(list.listDescription)
                            .font(.caption)
                            .foregroundStyle(.black)
                          
                        Spacer()
                        HStack {
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                            Rectangle()
                                .foregroundStyle(Color.gray.opacity(0.1))
                                .frame(width: 70, height: 50)
                                .cornerRadius(2)
                            
                    }
                    
                    Spacer()
                }
                .padding()
                .frame(width: 350, height: 140)
                .background(.white)
                .cornerRadius(5)
                .shadow(color: Color.gray.opacity(0.1), radius: 10, x: 0, y: 5)
                
                Button {
                    // detailview
                } label: {
                    Image(systemName: "arrow.right")
                        .foregroundStyle(.black)
                        
                }
                .padding(20)
            }
        }
    }

