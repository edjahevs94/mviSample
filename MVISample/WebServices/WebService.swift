//
//  WebService.swift
//  MVISample
//
//  Created by Edgard Vargas on 21/04/24.
//

import Foundation


@globalActor struct WebServiceActorGlobal {
    static let shared = WebServiceActor()
}

actor WebServiceActor {
    
    let dataSource = SampleContainerActorGlobal.shared
    
    func fetchComics() async throws -> Comic {
        
             let url = URL(string: "https://gateway.marvel.com:443/v1/public/comics?ts=1&apikey=0b2ab777bfbcd8a87de197eb7ae78888&hash=1d0846bfe34189618275355b4ce87cb2")
             
             let request = URLRequest(url: url!)
             
             let (data, response) = try await URLSession.shared.data(for: request)
             
             let fetchedData = try JSONDecoder().decode(Comic.self, from: try mapResponse(response: (data, response)))
            
            await processData(data: fetchedData)
            
             
             return fetchedData
            
        
    }
    
    func processData(data: Comic) async {
        
        for comic in data.data.results {
            let comicId = comic.id
            let comicName = comic.title
            let comicUrl = comic.thumbnail.path
            
            do {
             
                let imageData = try await getImageData(url: URL(string: "\(comicUrl).jpg")!)
                
                guard let sample: Sample = await dataSource.fetchSingleOrCreate(uid: "\(comicId)", entity: Sample(uid: "\(comicId)")) else {
                    return
                }
                
                sample.uid = "\(comicId)"
                sample.name = comicName
                sample.url = comicUrl
                sample.imageData = imageData
                sample.test = "test"
                
            } catch {
                guard let sample: Sample = await dataSource.fetchSingleOrCreate(uid: "\(comicId)", entity: Sample(uid: "\(comicId)")) else {
                    return
                }
                
                sample.uid = "\(comicId)"
                sample.name = comicName
                sample.url = comicUrl
                sample.test = "test"
            }
          
            
        }
       
        let comicsDB: [Sample] = await dataSource.fetchEntities()
        await dataSource.removeEntitiesWithNoChangesToSave(entities: comicsDB)
        await dataSource.save()
    }
    
    func getImageData(url: URL) async throws -> (Data) {
        
        let request = URLRequest(url: url)
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            return data
        } catch {
            throw error
        }
    }
    
}
