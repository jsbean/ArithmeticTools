//
//  SequenceType.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

extension SequenceType where Generator.Element: ArithmeticType {
    
    public var sum: Generator.Element { return reduce(0) { $0 + $1 } }
    
    public var gcd: Generator.Element? {
        guard let min = self.minElement() else { return nil }
        return self.map { greatestCommonDivisor(min, $0) }.minElement()
    }    
}