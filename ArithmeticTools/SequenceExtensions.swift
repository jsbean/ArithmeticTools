//
//  SequenceExtensions.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation


extension Sequence where Iterator.Element: Integer {
    
    public var sum: Iterator.Element {
        return reduce(0, +)
    }
    
    /**
     Greatest common divisor of elements in Sequence.
     
     >`[8,12].gcd -> 4`
     */
    public var gcd: Iterator.Element? {
        
        guard let min = self.min() else {
            return nil
        }
        
        return self.map { ArithmeticTools.gcd($0, min) }.min()
    }
}

extension Sequence where Iterator.Element: FloatingPoint {
    
    public var sum: Iterator.Element {
        return reduce(0, +)
    }
}
