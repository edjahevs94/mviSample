//
//  SampleSceneRouter.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation
import SwiftUI

public class SampleSceneRouter: SceneRouter {
    @Published public var path: NavigationPath
    
    required public init(with path: NavigationPath = NavigationPath()) {
        self.path = path
    }
    
    public func navigate(to destination: any Hashable) {
        path.append(destination)
    }
    
    public func pop() {
        path.removeLast()
    }
    
}
