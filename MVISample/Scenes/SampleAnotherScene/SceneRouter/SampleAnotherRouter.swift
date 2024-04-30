//
//  SampleAnotherRouter.swift
//  MVISample
//
//  Created by EdgardVS on 23/04/24.
//

import Foundation

enum SampleAnotherRoute: Hashable {
    //I.E case home
    case anotherDetail
}

final class SampleAnotherRouter: SceneNavigationHandler<SampleAnotherRoute> {
    
    //One function per destination
    //I.E func showHome(){
    //  navigate(to: SampleAnotherRoute.home)
    //}
    func showAnotherDetail() {
        navigate(to: SampleAnotherRoute.anotherDetail)
    }
}
