//
//  SampleRouter.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation

enum SampleRoute: Hashable {
    //I.E case home
    case detail(name: String, url: String)
    case another(name: String)
}

final class SampleRouter: SceneNavigationHandler<SampleRoute> {
    
    //One function per destination
    //I.E func showHome(){
    //  navigate(to: SampleRoute.home)
    //}
    func showDetail(name: String, url: String) {
        navigate(to: SampleRoute.detail(name: name, url: url))
    }
    
    func showAnother(name: String) {
        navigate(to: SampleRoute.another(name: name))
    }
}
