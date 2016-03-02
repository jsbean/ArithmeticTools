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
    
    private let doOvershoot: Bool
    private var hasOvershot: Bool = false
    
    private var power: T
    private var coefficient: T
    private var max: T?
    
    public init(coefficient: T, max: T? = nil, doOvershoot: Bool = false) {
        self.power = coefficient
        self.coefficient = coefficient
        self.max = max
        self.doOvershoot = doOvershoot
    }

    public func next() -> Element? {
        if doOvershoot {
            if hasOvershot { return nil }
            if power > max {
                hasOvershot = true
                return power
            }
        }
        let result = power
        power = power * 2
        if let max = max { return result <= max ? result : nil }
        return result
    }
}