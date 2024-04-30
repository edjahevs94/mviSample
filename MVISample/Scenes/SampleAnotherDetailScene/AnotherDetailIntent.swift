//
//  AnotherDetailIntent.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

extension AnotherDetailView {
    
    final class Intent {
        
        private weak var model: AnotherDetailModelActions?
        
        init(model: AnotherDetailModelActions? = nil) {
            self.model = model
        }
        
    }
    
}
