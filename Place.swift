//
//  Place.swift
//  Lugares
//
//  Created by Gerard Divi on 4/10/16.
//  Copyright © 2016 Gerard Divi. All rights reserved.
//

import Foundation
import UIKit

class Place {
    
    var name = ""
    var type = ""
    var location = ""
    var image: UIImage!
    var rating = "rating"
    var telephoneNumber = ""
    var web = ""
    
    
    init(name: String, type: String, location: String, image: UIImage, telephoneNumber: String, web: String) {
        self.name = name
        self.type = type
        self.location = location
        self.image = image
        self.telephoneNumber = telephoneNumber
        self.web = web
    }
}
