//
//  ReplaceElements.swift
//  ArrayTools
//
//  Created by James Bean on 2/21/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Array {
    
    /**
    Replace element at index with a new element

    - parameter index:      Index of element to be replaced
    - parameter newElement: New element to replace element at index
    */
    mutating func replaceElementAt<T: Any>(index: Int, withElement newElement: T) throws {
        guard index > 0 && index < self.count else { throw ArrayError.RemovalError }
        removeAtIndex(index)
        insert(newElement as! Element, atIndex: index)
    }
    
    /**
    Replace the last element in Array with a new element

    - parameter newElement: New element to replace last element
    */
    mutating func replaceLastWith(element: Element) throws {
        guard self.count > 0 else { throw ArrayError.RemovalError }
        removeLast()
        append(element)
    }
    
    /**
    Replace first element in Array with a new element

    - parameter newElement: New element to replace first element
    */
    mutating func replaceFirstWith(element: Element) throws {
        try removeFirst()
        insert(element, atIndex: 0)
    }
}