//
//  ListProcessing.swift
//  ArrayTools
//
//  Created by James Bean on 2/22/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension Array {
    
    /// From Chris Eidhof: http://chris.eidhof.nl/posts/swift-tricks.html
    
    public var destructured: (Element, [Element])? {
        return count == 0 ? nil : (self.first!, Array(self[1..<self.count]))
    }
    
    // TODO: take
    
    // TODO: drop
}

public func + <T: Any>(head: T, tail: [T]) -> [T] {
    return [head] + tail
}

public func + <T: Any>(list: [T], item: T) -> [T] {
    return list + [item]
}