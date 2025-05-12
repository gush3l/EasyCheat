//
//  ContentView.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI
import SwiftData
import Photos
import PhotosUI

struct ContentView: View {
    @StateObject private var viewModel = ImageViewModel()
    @State private var selectedItems: [PhotosPickerItem] = []

    var body: some View {
        ZStack {
            if !viewModel.loadedImages.isEmpty {
                ImageGalleryView(images: viewModel.loadedImages)
            } else {
                InstructionsView()
            }

            if viewModel.loadedImages.isEmpty {
                PhotoPickerButton(viewModel: viewModel, selectedItems: $selectedItems)
            }

            if viewModel.isLoading {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()

                LoadingModalView(
                    totalImages: viewModel.totalImagesToLoad,
                    loadedImages: viewModel.imagesLoaded
                )
            }
        }
        .onAppear() {
            viewModel.requestPhotoLibraryAuthorization()
        }
        .alert(isPresented: $viewModel.showingAlert) {
            Alert(
                title: Text("Permission Denied"),
                message: Text("You have denied access to the photo library. Please enable access in your settings if you want to use this app."),
                dismissButton: .default(Text("OK")) {
                    if let settingsURL = URL(string: UIApplication.openSettingsURLString),
                       UIApplication.shared.canOpenURL(settingsURL) {
                        UIApplication.shared.open(settingsURL)
                    }
                }
            )
        }
    }
}

#Preview {
    ContentView()
}
