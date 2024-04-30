//
//  AnotherDetailView.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import SwiftUI

struct AnotherDetailView: View {
    
    typealias ContainerType = MVIContainer<AnotherDetailView.Intent,AnotherDetailModelState>
    
    @StateObject private var mviContainer: ContainerType
    
    private var model: AnotherDetailModelState {
        return mviContainer.model
    }
    
    private var intent: AnotherDetailView.Intent{
        return mviContainer.intent
    }
    
    var body: some View {
        Text("Another view detail")
    }
    
}

extension AnotherDetailView {
    
    static func build() -> some View {
        let model = AnotherDetailView.Model()
        let intent = AnotherDetailView.Intent(model: model)
        let container = AnotherDetailView.ContainerType(intent: intent,
                                                      model: model,
                                                      modelChangePublisher: model.objectWillChange)
        
        return AnotherDetailView(mviContainer: container)
    }
    
}

#Preview {
    AnotherDetailView.build()
}
