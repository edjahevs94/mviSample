//
//  SampleAnotherModel.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import Foundation
import SwiftData

protocol SampleAnotherModelState {
    //I.E var something: Int { get }
    var displayName: String { get }
}

protocol SampleAnotherModelActions: AnyObject {
    //I.E func doSomething(something: Int)
    func presentName(response: String)
}

extension SampleAnotherView {
    
    final class Model: ObservableObject, SampleAnotherModelState {
        
        @Published var displayName: String = " "
        
    }

}

extension SampleAnotherView.Model: SampleAnotherModelActions {
    
    func presentName(response: String) {
        displayName = response
    }
    
}
