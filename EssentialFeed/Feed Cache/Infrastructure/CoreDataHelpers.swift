//
//  CoreDataHelpers.swift
//  EssentialFeed
//
//  Created by Christos Tzimas on 24/4/25.
//

import CoreData

 extension NSPersistentContainer {
    
    enum LoadingError: Swift.Error {
        case modelNotFound
        case failedToLoadPersistentStores(Swift.Error)
    }
    
     static func load(name: String, model: NSManagedObjectModel, url: URL) throws -> NSPersistentContainer {
         
         let description = NSPersistentStoreDescription(url: url)
         let container = NSPersistentContainer(name: name, managedObjectModel: model)
         
         container.persistentStoreDescriptions = [description]
         var loadError: Swift.Error?
         container.loadPersistentStores { loadError = $1 }
         try loadError.map { throw $0 }
         
         return container
     }
}

extension NSManagedObjectModel {
    static func with(name: String, in bundle: Bundle) -> NSManagedObjectModel? {
        bundle
            .url(forResource: name, withExtension: "momd")
            .flatMap { NSManagedObjectModel(contentsOf: $0) }
    }
}
