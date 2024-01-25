//
//  SkyboxControls.swift
//  Skyboxes
//
//  Created by Matt on 1/24/24.
//

import SwiftUI

struct SkyboxControlsView: View {
    var body: some View {
        HStack {
            SkyboxButton(onClick: {
                
            }, iconName: "tree")
            SkyboxButton(onClick: {
                
            }, iconName: "moon")
            SkyboxButton(onClick: {
                
            }, iconName: "sunset")
            SkyboxButton(onClick: {
                
            }, iconName: "car")
            SkyboxButton(onClick: {
                
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
