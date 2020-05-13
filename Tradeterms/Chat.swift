//
//  Chat.swift
//  Tradeterms
//
//  Created by Jose Manuel Mendoza Marín on 13/05/2020.
//  Copyright © 2020 JoseManuelYPablo. All rights reserved.
//

import UIKit
import os.log

class Chat: NSObject, NSCoding {
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
         static let photo = "photo"
        static let last = "description"

    }
    var name: String
    var last: String
    var photo: UIImage?
    
    //MARK: NSCoding
    public func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: PropertyKey.name)
        aCoder.encode(last, forKey: PropertyKey.last)
        aCoder.encode(photo, forKey: PropertyKey.photo)
    }
    
    public required convenience init?(coder aDecoder: NSCoder) {
        // The name is required. If we cannot decode a name string, the initializer should fail.
        guard let name = aDecoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Chat object.", log: OSLog.default, type: .debug)
            return nil
        }
        guard let last = aDecoder.decodeObject(forKey: PropertyKey.last) as? String else {
            os_log("Unable to decode the description for a Chat object.", log: OSLog.default, type: .debug)
            return nil
        }
        
        // Because photo is an optional property of Meal, just use conditional cast.
        let photo = aDecoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        
        // Must call designated initializer.
        self.init(name: name,last: last, photo: photo)
    }
    
    
    //MARK: Archiving Paths
    
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("chat")
    
    
    //MARK: Initialization
    
    init?(name: String,last: String, photo: UIImage?) {
        
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        guard !last.isEmpty else {
            return nil
        }
        
        // Initialize stored properties.
        self.name = name
        self.last = last
        self.photo = photo
        
    }
}
