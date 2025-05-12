//
//  LoadingModalView.swift
//  EasyCheat
//
//  Created by Mihai on 11/5/25.
//

import SwiftUI

struct LoadingModalView: View {
    let totalImages: Int
    let loadedImages: Int
    
    var body: some View {
        VStack {
            Text("Loading Images")
                .font(.headline)
                .padding(.bottom, 8)
            
            ProgressView(value: Double(loadedImages), total: Double(totalImages))
                .progressViewStyle(LinearProgressViewStyle())
                .padding(.horizontal)
            
            Text("\(loadedImages) of \(totalImages)")
                .font(.caption)
                .padding(.top, 8)
        }
        .frame(width: 250)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(Color(.systemBackground))
                .shadow(radius: 8)
        )
    }
}
