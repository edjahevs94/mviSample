//
//  SampleDetailSceneModel.swift
//  MVISample
//
//  Created by EdgardVS on 22/04/24.
//

import Foundation
import SwiftData

struct DisplayComic {
    var name: String
    var url: String
}

protocol SampleDetailSceneModelState {
    //I.E var something: Int { get }
    var displayComic: DisplayComic { get }
}

protocol SampleDetailSceneModelActions: AnyObject {
    //I.E func doSomething(something: Int)
    func presentComic(name: String, url: String)
}

extension SampleDetailSceneView {
    
    final class Model: ObservableObject, SampleDetailSceneModelState {
        
        @Published var displayComic: DisplayComic = DisplayComic(name: "name", url: "url")
        
       
        
        
        func presentComic(name: String, url: String) {
            displayComic = DisplayComic(name: name, url: url)
        }
        
    }

}

extension SampleDetailSceneView.Model: SampleDetailSceneModelActions {
    
}
