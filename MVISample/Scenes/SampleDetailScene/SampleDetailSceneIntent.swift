//
//  SampleDetailSceneIntent.swift
//  MVISample
//
//  Created by EdgardVS on 22/04/24.
//

extension SampleDetailSceneView {
    
    final class Intent {
        
        private weak var model: SampleDetailSceneModelActions?
        
        var name: String
        
        var url: String
        
        init(model: SampleDetailSceneModelActions? = nil, name: String, url: String) {
            self.model = model
            self.name = name
            self.url = url
        }
        
        func doComic() {
            model?.presentComic(name: name, url: url)
            
        }
        
    }
    
}
