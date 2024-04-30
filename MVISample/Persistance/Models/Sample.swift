//
//  Sample.swift
//  MVISample
//
//  Created by Edgard Vargas on 28/04/24.
//

import Foundation
import SwiftData

@Model
final class Sample: UniquedObject {
    
    
    var uid: String
    var name: String
    var url: String
    var imageData: Data?
    var test: String?
    
    init(uid: String, name: String = "-", url: String = "-", imageData: Data? = nil, test: String? = nil) {
        self.uid = uid
        self.name = name
        self.url = url
        self.imageData = imageData
        self.test = test
    }
    
    
}

extension Sample {
    static func fetchDescriptorEntityById(uid: String) -> FetchDescriptor<T> {
        let predicate = #Predicate<T> { T in
            T.uid == uid
        }
        var descriptor = FetchDescriptor<T>(predicate: predicate)
        descriptor.fetchLimit = 1
        return descriptor
    }
}
