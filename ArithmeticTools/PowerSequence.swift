//
//  PowerSequence.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public class PowerSequence<T: ArithmeticType>: SequenceType {

    private let doOvershoot: Bool
    private let coefficient: T
    private let max: T
    
    public typealias Generator = PowerGenerator<T>
    
    public init(coefficient: T, max: T, doOvershoot: Bool = false) {
        self.coefficient = coefficient
        self.max = max
        self.doOvershoot = doOvershoot
    }
    
    public func generate() -> Generator {
        return PowerGenerator(coefficient: coefficient, max: max, doOvershoot: doOvershoot)
    }
}