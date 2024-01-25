//
//  ImmersiveView.swift
//  Skyboxes
//
//  Created by Matt on 1/23/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {
    
    @Environment(\.openWindow) var openWindow
    @EnvironmentObject var skyboxSettings: SkyboxSettings
    
    var body: some View {
        RealityView { content in
            guard let skyboxEntity = createSkybox() else {
                return
            }
            
            content.add(skyboxEntity)
        } update: { content in
            updateSkybox(with: skyboxSettings.currentSkybox, content: content)
        }
        .onAppear(perform: {
            openWindow(id: "SkyboxControls")
        })
    }
    
    private func createSkybox() -> Entity? {
        // create a large sphere
        let skyboxMesh = MeshResource.generateSphere(radius: 1000)
        
        // skybox image material
        var skyboxMaterial = UnlitMaterial()
        guard let skyboxTexture = try? TextureResource.load(named: "Garden") else
        { return nil }
        skyboxMaterial.color = .init(texture: .init(skyboxTexture))
        
        // create entity
        let skyboxEntity = Entity()
        skyboxEntity.components.set(
            ModelComponent(
                mesh: skyboxMesh,
                materials: [skyboxMaterial]
            )
        )
        skyboxEntity.name = "Skybox"
        
        // flip normals
        skyboxEntity.scale = .init(-1, 1, 1)
        
        return skyboxEntity
    }
    
    private func updateSkybox(with newSkyboxName: String, content: RealityViewContent) {
        let skyboxEntity = content.entities.first { entity in
            entity.name == "Skybox"
        }
        
        guard let skyboxTexture = try? TextureResource.load(named: newSkyboxName) else {
            return
        }
        var skyboxMaterial = UnlitMaterial()
        skyboxMaterial.color = .init(texture: .init(skyboxTexture))
    
        // create a large sphere
        let skyboxMesh = MeshResource.generateSphere(radius: 1000)
        
        // update the entity
        skyboxEntity?.components.set(
            ModelComponent(
                mesh: skyboxMesh,
                materials: [skyboxMaterial]
            )
        )
    }
}

#Preview {
    ImmersiveView()
        .previewLayout(.sizeThatFits)
}
