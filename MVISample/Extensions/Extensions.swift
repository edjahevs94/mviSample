//
//  ViewExtensions.swift
//  MVISample
//
//  Created by Edgard Vargas on 28/04/24.
//

import Foundation
import SwiftUI

fileprivate struct FirstAppear: ViewModifier {
    
    @State private var firstAppear = true
    var perform: () -> ()
    
    
    func body(content: Content) -> some View {
        content
            .onAppear(perform: {
                if firstAppear {
                    perform()
                    firstAppear = false
                }
            })
    }
    
}

extension View {
    public func onFirstAppear(perform: @escaping () -> ()) -> some View {
        self.modifier(FirstAppear(perform: perform))
    }
}



extension URLRequest {
    
   
    
    static func getImageData(url: URL) async throws -> (Data) {
        
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            throw error
        }
    }
}
