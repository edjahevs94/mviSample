//
//  SampleDestinationModifier.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import SwiftUI

public extension View {
    
    internal func withMainRouterForSample(sceneAppRouter: any SceneRouter) -> some View {
        self.navigationDestination(for: SampleRoute.self) { destination in
            switch destination {
                //I.E case .home:
                //Text("Home")
            case .detail(name: let name, url: let url):
                SampleDetailSceneView.build(name: name, url: url)
            case .another(name: let name):
                SampleAnotherView.build(sceneAppRouter: sceneAppRouter, name: name)
            }
        }
    }
    
}
