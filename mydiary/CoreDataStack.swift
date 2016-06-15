//
//  CoreDataStack.swift
//  Core_Data_Demo1
//
//  Created by power on 16/6/5.
//  Copyright © 2016年 power. All rights reserved.
//

import CoreData

class CoreDataStack: NSObject
{
    let context: NSManagedObjectContext
    let coordinator: NSPersistentStoreCoordinator
    let model: NSManagedObjectModel
    let store: NSPersistentStore?
    
    
    static func  defaultStack() -> CoreDataStack
    {
        return instance
    }
    
    
    private static let instance = CoreDataStack()
    
    private override init()
    {
        let bundle = NSBundle.mainBundle()
        let modelURL = bundle.URLForResource("Diarydetaildata", withExtension: "momd")!
        model = NSManagedObjectModel(contentsOfURL: modelURL)!
        
        coordinator = NSPersistentStoreCoordinator(managedObjectModel: model)
        context = NSManagedObjectContext(concurrencyType: .MainQueueConcurrencyType)
        context.persistentStoreCoordinator = coordinator
        
        let manager = NSFileManager.defaultManager()
        let urls = manager.URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask)
        let documentsURL = urls.first!
        let storeURL = documentsURL.URLByAppendingPathComponent("Diarydetaildata")
        
        store = (try! coordinator.addPersistentStoreWithType(NSSQLiteStoreType, configuration: nil, URL: storeURL, options: nil))
    }
    
    func saveContext()
    {
        if context.hasChanges
        {
            do
            {
                try context.save()
                }
            catch
            {
                print("Save failed...")
            }
        }
    }
    
    
}
