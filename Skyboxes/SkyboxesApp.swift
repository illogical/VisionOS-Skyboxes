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
        // this opens first and is responsible for opening the SkyboxControls WindowGroup
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
        }.immersionStyle(selection: .constant(.full), in: .full)
        
        WindowGroup(id: "SkyboxControls") {
            SkyboxControlsView()
        }
        .defaultSize(width: 60, height: 10)
    }
}
