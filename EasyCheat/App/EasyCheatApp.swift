//
//  EasyCheatApp.swift
//  EasyCheat
//
//  Created by Mihai on 6/5/25.
//

import SwiftUI
import SwiftData

@main
struct EasyCheatApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            HostingControllerWrapper(content: ContentView())
        }
        .modelContainer(sharedModelContainer)
    }
}

struct HostingControllerWrapper<Content: View>: UIViewControllerRepresentable {
    let content: Content

    func makeUIViewController(context: Context) -> some UIViewController {
        HostingController(rootView: content)
    }

    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
}
