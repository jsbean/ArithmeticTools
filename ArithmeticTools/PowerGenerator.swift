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
    private var base: T
    private var max: T?
    
    public init(base: T, max: T? = nil) {
        self.power = base
        self.base = base
        self.max = max
    }

    public func next() -> Element? {
        let result = power
        power = power * 2
        if let max = max { return result <= max ? result : nil }
        return result
    }
}