//
//  ElementsAtIndices.swift
//  ArrayTools
//
//  Created by James Bean on 2/21/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Array {
    
    /**
    - parameter index: Index of desired object.

    - returns: Element at index if present. Otherwise nil.
    */
    public subscript (safe index: Int) -> Element? {
        return indices ~= index ? self[index] : nil
    }
    
    /// Second element in an Array
    public var second: Element? {
        if count < 2 { return nil }
        return self[1] as Element
    }
    
    /// Second-to-last element in Array
    public var penultimate: Element? {
        if count < 2 { return nil }
        return self[self.count - 2] as Element
    }
}