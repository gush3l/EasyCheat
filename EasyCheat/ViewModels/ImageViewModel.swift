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
    
    func loadImages(from items: [PhotosPickerItem]) {
        Task {
            var newImages: [UIImage] = []

            for item in items {
                if let data = try? await item.loadTransferable(type: Data.self),
                   let image = UIImage(data: data) {
                    newImages.append(image)
                }
            }

            await MainActor.run {
                loadedImages = newImages
            }
        }
    }
    
    func requestPhotoLibraryAuthorization() {
        PHPhotoLibrary.requestAuthorization(for: .addOnly) { status in
            self.authorizationStatus = status
            if status == .denied {
                self.showingAlert = true
            }
        }
    }
}
