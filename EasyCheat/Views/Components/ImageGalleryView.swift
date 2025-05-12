//
//  ImageGalleryView.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI

struct ImageGalleryView: View {
    let images: [UIImage]

    var body: some View {
        TabView {
            ForEach(0..<images.count, id: \.self) { index in
                Image(uiImage: images[index])
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .cornerRadius(8)
                    .shadow(radius: 3)

                if index < images.count - 1 {
                    Rectangle()
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .never))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
