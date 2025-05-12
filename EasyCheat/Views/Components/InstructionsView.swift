//
//  InstructionsView.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI

struct InstructionsView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: "photo")
                Text("Select the images to use.")
            }
            .padding(Edge.Set.bottom, 20)
            HStack {
                Image(systemName: "hand.draw.fill")
                Text("Swipe left or right to navigate.")
            }
            .padding(Edge.Set.bottom, 20)
            HStack {
                Image(systemName: "iphone")
                Text("The images are divided by a black border.")
            }
            .padding(Edge.Set.bottom, 20)
        }
        .padding()
    }
}
