//
//  SkyboxesApp.swift
//  Skyboxes
//
//  Created by Matt on 1/23/24.
//

import SwiftUI

@main
struct SkyboxesApp: App {
    
    @ObservedObject var skyboxSettings = SkyboxSettings()
    
    var body: some Scene {
        // this opens first and is responsible for opening the SkyboxControls WindowGroup
        ImmersiveSpace(id: "ImmersiveSpace") {
            ImmersiveView()
                .environmentObject(skyboxSettings)
        }.immersionStyle(selection: .constant(.full), in: .full)
        
        WindowGroup(id: "SkyboxControls") {
            SkyboxControlsView()
                .environmentObject(skyboxSettings)
        }
        .defaultSize(width: 60, height: 10)
    }
}


class SkyboxSettings: ObservableObject {
    @Published var currentSkybox = ""
}
