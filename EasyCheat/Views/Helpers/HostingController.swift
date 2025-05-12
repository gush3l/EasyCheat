//
//  HostingController.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import Foundation
import SwiftUI

class HostingController<Content: View>: UIHostingController<Content> {
    override var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }

    override var preferredScreenEdgesDeferringSystemGestures: UIRectEdge {
        return [.bottom]
    }
}
