//
//  SampleDetailSceneView.swift
//  MVISample
//
//  Created by EdgardVS on 22/04/24.
//

import SwiftUI

struct SampleDetailSceneView: View {
    
    typealias ContainerType = MVIContainer<SampleDetailSceneView.Intent,SampleDetailSceneModelState>
    
    @StateObject private var mviContainer: ContainerType
    
    private var model: SampleDetailSceneModelState {
        return mviContainer.model
    }
    
    private var intent: SampleDetailSceneView.Intent{
        return mviContainer.intent
    }
    
    var body: some View {
        VStack {
            
            Text(mviContainer.model.displayComic.name)
            
            AsyncImage(url: URL(string: mviContainer.model.displayComic.url)) { image in
                image
                    .resizable()
                    .frame(width: 100, height: 100)
            } placeholder: {
                ProgressView()
                    .frame(width: 100, height: 100)
            }

        }.task {
            mviContainer.intent.doComic()
        }
    }
    
}

extension SampleDetailSceneView {
    
    static func build(name: String, url: String) -> some View {
        let model = SampleDetailSceneView.Model()
        let intent = SampleDetailSceneView.Intent(model: model, name: name, url: url)
        let container = SampleDetailSceneView.ContainerType(intent: intent,
                                                      model: model,
                                                      modelChangePublisher: model.objectWillChange)
        
        return SampleDetailSceneView(mviContainer: container)
    }
    
}

#Preview {
    SampleDetailSceneView.build(name: "Name", url: "_")
}
