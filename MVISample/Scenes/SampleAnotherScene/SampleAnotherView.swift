//
//  SampleAnotherView.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import SwiftUI

struct SampleAnotherView: View {
    
    typealias ContainerType = MVIContainer<SampleAnotherView.Intent,SampleAnotherModelState>
    
    @StateObject private var mviContainer: ContainerType
    var router: SampleAnotherRouter
    
    private var model: SampleAnotherModelState {
        return mviContainer.model
    }
    
    private var intent: SampleAnotherView.Intent {
        return mviContainer.intent
    }
     
    var body: some View {
        VStack{
            Text("Another View with complex navigation, hi \(model.displayName)")
            Button(action: {
                router.showAnotherDetail()
            }, label: {
                Text("Go to another view")
            })
        }
    
//        .onFirstAppear {
//            print("init on first appear")
//        }
        .modifier(NavigationConfig(sceneRouter: router.sceneAppRouter))
    }
    
}

//Navigation and toolbar config
extension SampleAnotherView {
    
    struct NavigationConfig: ViewModifier{
        
        var sceneRouter: any SceneRouter
        
        func body(content: Content) -> some View {
            content
                .withMainRouterForSampleAnother(sceneAppRouter: sceneRouter)
                .modifier(ToolbarConfig())
        }
        
    }
    
    struct ToolbarConfig: ViewModifier{
        
        func body(content: Content) -> some View {
            content
        }
        
    }
}

extension SampleAnotherView {
    
    static func build(sceneAppRouter: any SceneRouter, name: String) -> some View {
        let model = SampleAnotherView.Model()
        let intent = SampleAnotherView.Intent(model: model, name: name)
        let container = SampleAnotherView.ContainerType(intent: intent,
                                                      model: model,
                                                      modelChangePublisher: model.objectWillChange)
        
        return SampleAnotherView(mviContainer: container,
                                            router: SampleAnotherRouter(with: sceneAppRouter))
    }
    
}
