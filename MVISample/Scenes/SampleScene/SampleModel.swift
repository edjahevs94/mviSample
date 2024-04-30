//
//  SampleModel.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation
import SwiftData



struct DisplayFetchSample: Identifiable {
    var id: Int
    var name: String
    var url: String
    var imageData: Data?
}

protocol SampleModelState {
    //I.E var something: Int { get }
    var displayFetchSample: [DisplayFetchSample] { get }
    var displayLoading: Bool { get }
}

protocol SampleModelActions: AnyObject {
    //I.E func doSomething(something: Int)
    func presentFetchSample(response: [Sample])
    func presentLoading()
}

extension SampleView {
    
    final class Model: ObservableObject, SampleModelState {
        
        @Published var displayFetchSample: [DisplayFetchSample] = [DisplayFetchSample(id: 1, name: "Sample", url: "https://picsum.photos/200/300")]
        @Published var displayLoading: Bool = true
        
        
        
    }

}

extension SampleView.Model: SampleModelActions {
    func presentFetchSample(response: [Sample]) {
        displayFetchSample = response.map({ item in
            DisplayFetchSample(id: Int(item.uid) ?? 0, name: item.name, url: "\(item.url).jpg", imageData: item.imageData)
        })
    }
    
    func presentLoading() {
        displayLoading = false
    }
    
    
}
