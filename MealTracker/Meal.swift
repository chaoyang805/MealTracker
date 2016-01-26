//
//  Meal.swift
//  MealTracker
//
//  Created by chaoyang805 on 16/1/21.
//  Copyright © 2016年 jikexueyuan. All rights reserved.
//

import UIKit

class Meal : NSObject,NSCoding {
    // MARK: Properties
    var photo : UIImage?
    var rating : Int
    var name : String
    static let DocumentsDirectory = NSFileManager().URLsForDirectory(.DocumentDirectory, inDomains: .UserDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.URLByAppendingPathComponent("meals")
    // MARK: Types
    struct PropertyKey {
        static let nameKey = "name"
        static let photoKey = "photo"
        static let ratingKey = "rating"
    }
    // MARK: Initialization
    init?(name : String, photo : UIImage?,rating : Int) {
        self.rating = rating
        self.name = name
        self.photo = photo
        
        super.init()
        
        if name.isEmpty || rating < 0 {
            return nil
        }
    }
    // MARK: NSCoding
    required convenience init?(coder aDecoder: NSCoder) {
        let name = aDecoder.decodeObjectForKey(PropertyKey.nameKey) as! String
        let photo = aDecoder.decodeObjectForKey(PropertyKey.photoKey) as? UIImage
        let rating = aDecoder.decodeIntegerForKey(PropertyKey.ratingKey)
        self.init(name:name,photo:photo,rating:rating)
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(name, forKey: PropertyKey.nameKey)
        aCoder.encodeObject(photo, forKey: PropertyKey.photoKey)
        aCoder.encodeInteger(rating, forKey: PropertyKey.ratingKey)
    }
    
}