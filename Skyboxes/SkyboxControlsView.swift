//
//  SkyboxControls.swift
//  Skyboxes
//
//  Created by Matt on 1/24/24.
//

import SwiftUI

struct SkyboxControlsView: View {
    
    @EnvironmentObject var skyboxSettings: SkyboxSettings
    
    var body: some View {
        HStack {
            SkyboxButton(onClick: {
                skyboxSettings.currentSkybox = "Garden"
            }, iconName: "tree")
            SkyboxButton(onClick: {
                skyboxSettings.currentSkybox = "Library"
            }, iconName: "moon")
            SkyboxButton(onClick: {
                skyboxSettings.currentSkybox = "Dunes"
            }, iconName: "sunset")
            SkyboxButton(onClick: {
                skyboxSettings.currentSkybox = "Cliffside"
            }, iconName: "car")
            SkyboxButton(onClick: {
                skyboxSettings.currentSkybox = "Village"
            }, iconName: "building")
        }
    }
}

#Preview {
    SkyboxControlsView()
}

struct SkyboxButton: View {
    var onClick: () -> Void
    var iconName: String
    
    var body: some View {
        Button(
            action: onClick,
            label: {
                Image(systemName: iconName)
            }
        )
    }
}
