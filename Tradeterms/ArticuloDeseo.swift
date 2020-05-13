//
//  ArticuloDeseo.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class ArticuloDeseo: NSObject, NSCoding {
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
        static let descriptionI = "description"
        static let zone = "zone"
        static let photo = "photo"
        static let rating = "rating"
    }
    var name: String
    var descriptionI: String
    var zone: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: NSCoding
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(descriptionI, forKey: PropertyKey.descriptionI)
        aCoder.encode(zone, forKey: PropertyKey.zone)
        aCoder.encode(photo, forKey: PropertyKey.photo)
        aCoder.encode(rating, forKey: PropertyKey.rating)
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Articulo object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let descriptionI = aDecoder.decodeObject(forKey: PropertyKey.descriptionI) as? String else {
            os_log("Unable to decode the description for a Articulo object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let zone = aDecoder.decodeObject(forKey: PropertyKey.zone) as? String else {
            os_log("Unable to decode the zone for a Articulo object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        let rating = aDecoder.decodeInteger(forKey: PropertyKey.rating)
        
        // Must call designated initializer.
        self.init(name: name,descriptionI: descriptionI,zone: zone, photo: photo, rating: rating)
    }
    
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("Deseos")
    
    
    //MARK: Initialization
    
    init?(name: String,descriptionI: String,zone: String, photo: UIImage?, rating: Int) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        guard !descriptionI.isEmpty else {
            return nil
        }
        guard !zone.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.descriptionI = descriptionI
        self.zone = zone
        self.photo = photo
        self.rating = rating
        
        
    }
}
