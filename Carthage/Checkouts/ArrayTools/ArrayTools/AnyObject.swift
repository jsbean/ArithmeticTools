//
//  AnyObject.swift
//  ArrayTools
//
//  Created by James Bean on 3/1/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public extension Array where Element: AnyObject {
    
    // MARK: - AnyObject
    
    /**
    Check if Array contains object
    
    - parameter object: Object for which to check status as member of Array
    
    - returns: If Array contains object
    */
    func containsObject(object: Element) -> Bool {
        return indexOfObject(object) != nil
    }
    
    /**
     Get index of first instance of given object in `Array`
     
     - parameter object: Object for index to be found
     
     - returns: Index of object, if present. Otherwise `nil`.
     */
    func indexOfObject(object: Element) -> Int? {
        for (index, el) in self.enumerate() { if el === object { return index } }
        return nil
    }
    
    /**
     Remove object from `Array`.
     
     - parameter object: Object to remove
     */
    mutating func removeObject(object: Element) {
        let index: Int? = indexOfObject(object)
        if index != nil { removeAtIndex(index!) }
    }
}