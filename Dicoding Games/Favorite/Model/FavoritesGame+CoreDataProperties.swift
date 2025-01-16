//
//  FavoritesGame+CoreDataProperties.swift
//  
//
//  Created by naswakhansa on 04/01/25.
//
//

import Foundation
import CoreData


extension FavoritesGameEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoritesGameEntity> {
        return NSFetchRequest<FavoritesGameEntity>(entityName: "FavoritesGame")
    }

    @NSManaged public var backgroundImage: String?
    @NSManaged public var rating: String?
    @NSManaged public var released: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int64

}
