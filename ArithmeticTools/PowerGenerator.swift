//
//  PowerGenerator.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public class PowerGenerator<T: ArithmeticType>: GeneratorType {
    
    public typealias Element = T
    
    private var power: T
    private var min: T
    private var max: T
    
    public init(min: T, max: T) {
        self.power = min
        self.min = min
        self.max = max
    }

    public func next() -> Element? {
        let result = power
        power = power * 2
        return result <= max ? result : nil
    }
}