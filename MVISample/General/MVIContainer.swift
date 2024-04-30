//
//  MVIContainer.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation
import Combine

@MainActor
final class MVIContainer<Intent, Model>: ObservableObject {

 
    let intent: Intent
    let model: Model

    private var cancellable: Set<AnyCancellable> = []

    init(intent: Intent, model: Model, modelChangePublisher: ObjectWillChangePublisher) {
        self.intent = intent
        self.model = model

        DispatchQueue.main.async {
            modelChangePublisher
                .receive(on: RunLoop.main)
                .sink(receiveValue: self.objectWillChange.send)
                .store(in: &self.cancellable)
        }
    }
}
