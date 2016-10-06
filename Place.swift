//
//  Place.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class Place: NSManagedObject {
    
    @NSManaged var name: String
    @NSManaged var type: String
    @NSManaged var location: String
    @NSManaged var image: NSData?
    @NSManaged var rating: String?
    @NSManaged var telephoneNumber: String?
    @NSManaged var web: String?
    
    
//    init(name: String, type: String, location: String, image: UIImage, telephoneNumber: String, web: String) {
//        self.name = name
//        self.type = type
//        self.location = location
//        self.image = image
//        self.telephoneNumber = telephoneNumber
//        self.web = web
//    }
}
