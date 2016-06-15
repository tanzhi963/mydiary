//
//  Diartdetail+CoreDataProperties.swift
//  mydiary
//
//  Created by power on 16/6/10.
//  Copyright © 2016年 power. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Diartdetail {

    @NSManaged var createdate: String?
    @NSManaged var title: String?
    @NSManaged var content: String?

}
