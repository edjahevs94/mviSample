//
//  AnotherDetailModel.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import Foundation
import SwiftData

protocol AnotherDetailModelState {
    //I.E var something: Int { get }
}

protocol AnotherDetailModelActions: AnyObject {
    //I.E func doSomething(something: Int)
}

extension AnotherDetailView {
    
    final class Model: ObservableObject, AnotherDetailModelState {
        
    }

}

extension AnotherDetailView.Model: AnotherDetailModelActions {
    
}
