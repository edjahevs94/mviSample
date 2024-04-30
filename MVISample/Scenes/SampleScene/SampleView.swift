//
//  SampleView.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import SwiftUI

struct SampleView: View {
    
    typealias ContainerType = MVIContainer<SampleView.Intent,SampleModelState>
    
    @StateObject private var mviContainer: ContainerType
    var router: SampleRouter
    
    private var model: SampleModelState {
        return mviContainer.model
    }
    
    private var intent: SampleView.Intent {
        return mviContainer.intent
    }
     
    var body: some View {
        VStack{
            if model.displayLoading {
                ProgressView()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
            } else {
                List {
                    ForEach(model.displayFetchSample) { item in
                        HStack {
                            if let imageData = item.imageData {
                                if let image = UIImage(data: imageData) {
                                    Image(uiImage: image)
                                        .resizable()
                                        .frame(width: 75, height: 75)
                                }
                            } else {
                                AsyncImage(url: URL(string: item.url)) { image in
                                    image.resizable()
                                        .frame(width: 75, height: 75)
                                } placeholder: {
                                    ProgressView()
                                        .frame(width: 75, height: 75)
                                }
                            }
                            
                           

                            Text(item.name)
                        }.padding()
                            .onTapGesture {
                                router.showDetail(name: item.name, url: item.url)
                            }
                    }
                }
                .refreshable(action: {
                 
                    await mviContainer.intent.doFetchSample()
                })
                .listStyle(.plain)
            }
            
           
        }
//        .task {
//            await mviContainer.intent.doFetchSample()
//        }
        .onFirstAppear {
            Task {
                print("first appear")
                await mviContainer.intent.doFetchSample()
            }
            
        }
        .modifier(NavigationConfig(router: router))
    }
    
}

//Navigation and toolbar config
extension SampleView {
    
    struct NavigationConfig: ViewModifier{

        var router: SampleRouter
        
        func body(content: Content) -> some View {
            content
                .withMainRouterForSample(sceneAppRouter: router.sceneAppRouter)
                .modifier(ToolbarConfig(router: router))
        }
        
    }
    
    struct ToolbarConfig: ViewModifier{
        
        var router: SampleRouter
        
        func body(content: Content) -> some View {
            content
            
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Button(action: {
                            self.router.showAnother(name: "Edgard")
                        }, label: {
                            Text("Go")
                        })
                    }
                    ToolbarTitleMenu {
                        Text("Title")
                    }
                }
        }
        
    }
}

extension SampleView {
    
    static func build(sceneAppRouter: any SceneRouter) -> some View {
        let model = SampleView.Model()
        let intent = SampleView.Intent(model: model)
        let container = SampleView.ContainerType(intent: intent,
                                                      model: model,
                                                      modelChangePublisher: model.objectWillChange)
        
        return SampleView(mviContainer: container,
                                            router: SampleRouter(with: sceneAppRouter))
    }
    
}
