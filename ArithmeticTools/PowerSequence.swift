//
//  PowerSequence.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public class PowerSequence<T: ArithmeticType>: SequenceType {

    private let min: T
    private let max: T
    
    public typealias Generator = PowerGenerator<T>
    
    public init(min: T, max: T) {
        self.min = min
        self.max = max
    }
    
    public func generate() -> Generator {
        return PowerGenerator(min: min, max: max)
    }
}