//
//  ImageViewModel.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI
import Photos
import PhotosUI

class ImageViewModel: ObservableObject {
    @Published var loadedImages: [UIImage] = []
    @Published var authorizationStatus = PHAuthorizationStatus.notDetermined
    @Published var showingAlert = false

    @Published var isLoading = false
    @Published var totalImagesToLoad = 0
    @Published var imagesLoaded = 0

    func loadImages(from items: [PhotosPickerItem]) {
        Task {
            await MainActor.run {
                self.isLoading = true
                self.totalImagesToLoad = items.count
                self.imagesLoaded = 0
            }

            var newImages = [UIImage]()

            for item in items {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    newImages.append(image)
                }

                await MainActor.run {
                    self.imagesLoaded += 1
                }
            }

            await MainActor.run {
                self.loadedImages = newImages
                self.isLoading = false
            }
        }
    }

    func requestPhotoLibraryAuthorization() {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { [weak self] status in
            DispatchQueue.main.async {
                self?.authorizationStatus = status
                if status == .denied {
                    self?.showingAlert = true
                }
            }
        }
    }
}
