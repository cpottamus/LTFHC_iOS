//
//  DataStore.swift
//  LTFHC
//
//  Created by Carson Potter on 10/20/15.
//  Copyright © 2015 CPot. All rights reserved.
//

/*================================================================================================

    Here is where we create a singleton that will handle all our managed object context and will save things.

================================================================================================*/

import Foundation
import CoreData

class DataStore: NSObject {
    static var instance = DataStore()
    
    let model: NSManagedObjectModel
    let persistentStoreCoordinator: NSPersistentStoreCoordinator
    var mainThreadContext: LTFHCManagedObjectContext!
    let privateContext: LTFHCManagedObjectContext
    
    var activeMainThreadContexts: [LTFHCManagedObjectContext] = []
    
    override init() {
        let modelName = "LTFHC"
        guard let modelURL = NSBundle.mainBundle().URLForResource(modelName, withExtension: "momd") else {
            fatalError("Error loading model from bundle")
        }
        
        //initialize model
        model = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        //intiialize PSC
        persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        
        //Set store URL
        let urls = NSFileManager.defaultManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let docURL = urls[urls.endIndex - 1]
        let storeURL = docURL.URLByAppendingPathComponent("DataModel.sqlite")
        
        
        //Create persistent store for PSC, including auto migration.
        let options = [NSMigratePersistentStoresAutomaticallyOption: true, NSInferMappingModelAutomaticallyOption: true]
        do {
            try persistentStoreCoordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: options)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        
        //Init and stylize private Context.
        privateContext = LTFHCManagedObjectContext(concurrencyType: .PrivateQueueConcurrencyType)
        privateContext.persistentStoreCoordinator = persistentStoreCoordinator
        privateContext.mergePolicy = NSMergePolicy(mergeType: .MergeByPropertyStoreTrumpMergePolicyType)
        privateContext.name = "Private Context"
        
        super.init()
        dispatch_now_main {
            //init mainThread context.
            self.mainThreadContext = LTFHCManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
            self.mainThreadContext.parentContext = self.privateContext
            self.mainThreadContext.mergePolicy = NSMergePolicy(mergeType: .MergeByPropertyStoreTrumpMergePolicyType)
            self.mainThreadContext.name = "Main Thread Context"
        }
        
    }
    
}

class LTFHCManagedObjectContext: NSManagedObjectContext {
    //Save support
    func saveContext () {
        if self.hasChanges {
            do {
                try self.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                NSLog("Unresolved error \(nserror), \(nserror.userInfo)")

            }
        }
    }
    
    //TODO Add reset support

}

public func dispatch_now_main(closure: () -> ()) {
    if NSThread.isMainThread() {
        closure()
    } else {
        dispatch_sync(dispatch_get_main_queue(), closure)
    }
}