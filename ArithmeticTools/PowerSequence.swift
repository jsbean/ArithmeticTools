//
//  PowerSequence.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public class PowerSequence<T: ArithmeticType>: SequenceType {

    private let base: T
    private let max: T
    
    public typealias Generator = PowerGenerator<T>
    
    public init(base: T, max: T) {
        self.base = base
        self.max = max
    }
    
    public func generate() -> Generator {
        return PowerGenerator(base: base, max: max)
    }
}