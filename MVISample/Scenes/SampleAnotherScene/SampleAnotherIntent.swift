//
//  SampleAnotherIntent.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

extension SampleAnotherView {
    
    final class Intent {
        
        private weak var model: SampleAnotherModelActions?
        var name: String
        
        init(model: SampleAnotherModelActions? = nil, name:String) {
            self.model = model
            self.name = name
            doName()
            //print("init intent")
        }
        
        
        func doName() {
            model?.presentName(response: name)
        }
        
    }
    
}
