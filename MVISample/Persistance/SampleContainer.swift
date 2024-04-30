//
//  SampleData.swift
//  MVISample
//
//  Created by Edgard Vargas on 28/04/24.
//



import Foundation
import SwiftData

@globalActor struct SampleContainerActorGlobal {
    static let shared = SampleContainerActor()
}

actor SampleContainerActor: ModelActor {
    
    let modelContainer: ModelContainer
    let modelContext: ModelContext
    let modelExecutor: any ModelExecutor
    
    init() {
        
        print("me instacie una vez")
        self.modelContainer = try! ModelContainer(for: Sample.self, configurations: ModelConfiguration("Sample"))
        self.modelContext = ModelContext(modelContainer)
        self.modelContext.autosaveEnabled = false
        modelExecutor = DefaultSerialModelExecutor(modelContext: modelContext)
        
        if let url = modelContainer.configurations.first?.url.path(percentEncoded: false) {
            print("container actor: \(url)")
        }
        
    }
    
    func save() {
        do {
            try modelContext.save()
        } catch  {
            print(error)
        }
    }
    
    func insert<T: PersistentModel>(entity: T) {
        modelContext.insert(entity)
        
    }
    
    func remove<T: PersistentModel>(entity: T) {
        modelContext.delete(entity)
        do {
            try modelContext.save()
        } catch  {
            print(error)
        }
    }
    
    func removeEntitiesWithNoChangesToSave<T: PersistentModel>(entities: [T]) {
        
        entities.filter({!$0.hasChanges}).forEach({
            item in
            //print("===removed", item.persistentModelID)
            remove(entity: item)
        })
        
    }
    
    func fetchEntities<T: PersistentModel>() -> [T] {
        do {
            let predicate:Predicate<T>? = nil
            let fetchDescriptor = FetchDescriptor<T>(predicate: predicate)
            let entities: [T] = try modelContext.fetch(fetchDescriptor)
            return entities
        } catch {
            print(error.localizedDescription)
            return []
        }
        
    }
    
    func fetchEntityByUid<T:UniquedObject>(uid: String) -> T? {
        
        do {
            let fetchDescriptor = T.fetchDescriptorEntityById(uid: uid)
            
            let entities = try modelContext.fetch(fetchDescriptor)
            
            return entities.first
        } catch  {
            print(error.localizedDescription)
            return nil
        }
        
    }
    
    func fetchSingleOrCreate<T:UniquedObject>(uid: String, entity: T) -> T? {
        return fetchEntityByUid(uid: uid) ?? createEntity(entity: entity, uid: uid)
    }
    
    
    func createEntity<T: UniquedObject>(entity: T, uid: String) -> T? {
        modelContext.insert(entity)
        
        do {
            
            let fetchDescriptor = T.fetchDescriptorEntityById(uid: uid)
            
            let entities = try modelContext.fetch(fetchDescriptor)
            
            return entities.first!
        } catch  {
            print(error.localizedDescription)
            return nil
        }
    }
    
}

//Protocolo para poder realizar predicados genericos en los modelos de entidad
protocol UniquedObject: PersistentModel {
    //descomentar cuando en swiftdata el fetchdescriptor soporte genericos en el predicado
    //var uid: String { get set }
    typealias T = Self
    static func fetchDescriptorEntityById(uid: String) -> FetchDescriptor<Self>
}
