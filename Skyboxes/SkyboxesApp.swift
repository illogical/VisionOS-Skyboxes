//
//  SkyboxesApp.swift
//  Skyboxes
//
//  Created by Matt on 1/23/24.
//

import SwiftUI

@main
struct SkyboxesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }

        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
    }
}
