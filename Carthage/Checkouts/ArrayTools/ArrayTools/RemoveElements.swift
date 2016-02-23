//
//  RemoveElements.swift
//  ArrayTools
//
//  Created by James Bean on 2/21/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Array {
    
    // MARK: - Remove elements from Array
    
    /**
    Remove first element of Array
    */
    mutating func removeFirst() throws {
        guard count > 0 else { throw ArrayError.RemovalError }
        self.removeAtIndex(0)
    }
    
    /**
    Remove first number of elements from Array

    - parameter amount: Amount of elements to remove from beginning of Array
    */
    mutating func removeFirst(amount amount: Int) throws {
        guard count >= amount else { throw ArrayError.RemovalError }
        for _ in 0..<amount { self.removeAtIndex(0) }
    }
    
    /**
    Remove last number of elements from Array

    - parameter amount: Amount of elements to remove from end of Array
    */
    mutating func removeLast(amount amount: Int) throws {
        guard count >= amount else { throw ArrayError.RemovalError }
        for _ in 0..<amount { self.removeLast() }
    }
}