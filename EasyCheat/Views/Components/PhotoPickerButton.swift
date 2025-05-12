//
//  PhotoPickerButton.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI
import PhotosUI

struct PhotoPickerButton: View {
    @ObservedObject var viewModel: ImageViewModel
    @Binding var selectedItems: [PhotosPickerItem]
    
    var body: some View {
        VStack {
            Spacer()
            PhotosPicker(
                selection: $selectedItems,
                matching: .images,
                preferredItemEncoding: .automatic,
                photoLibrary: .shared(),
                label: {
                    Text("Select Photos")
                        .foregroundStyle(.white)
                        .padding(10)
                        .background(Color.blue)
                        .clipShape(Capsule())
                }
            )
            .onChange(of: selectedItems) { _, newItems in
                viewModel.loadImages(from: newItems)
            }
            .padding(.bottom)
        }
    }
}
