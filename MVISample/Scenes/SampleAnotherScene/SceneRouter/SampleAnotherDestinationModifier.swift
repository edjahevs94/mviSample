//
//  SampleAnotherDestinationModifier.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import SwiftUI

public extension View {
    
    internal func withMainRouterForSampleAnother(sceneAppRouter: any SceneRouter) -> some View {
        self.navigationDestination(for: SampleAnotherRoute.self) { destination in
            switch destination {
                //I.E case .home:
                //Text("Home")
            case .anotherDetail:
                AnotherDetailView.build()
                
            }
        }
    }
    
}
