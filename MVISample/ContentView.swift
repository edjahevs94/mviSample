//
//  ContentView.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var sampleAppRouter: SampleSceneRouter
    
    init() {
        self._sampleAppRouter = StateObject(wrappedValue: SampleSceneRouter())
    }
    
    var body: some View {
        NavigationStack(path: $sampleAppRouter.path) {
            SampleView.build(sceneAppRouter: self.sampleAppRouter)
        }
        
    }
}

#Preview {
    ContentView()
}
