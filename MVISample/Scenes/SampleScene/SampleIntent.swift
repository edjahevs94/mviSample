//
//  SampleIntent.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

extension SampleView {
    
    final class Intent {
        
        private weak var model: SampleModelActions?
        
        init(model: SampleModelActions? = nil) {
            self.model = model
            //print("intent appear")
        }
        
        
        func doFetchSample() async {
            do {
                
                let _ = try await WebServiceActorGlobal.shared.fetchComics()
                let comicsDB: [Sample] = await SampleContainerActorGlobal.shared.fetchEntities()
                model?.presentFetchSample(response: comicsDB)
                model?.presentLoading()
            } catch  {
                print(error)
            }
        }
        
        
    }
    
}
