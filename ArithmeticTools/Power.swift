//
//  Power.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/**
 Get power-of-two value that is closest to a target value.
 
 - parameter target: Value to check for closest power-of-two
 
 - returns: Power-of-two value closest to target value
 */
public func closestPowerOfTwoTo<T: ArithmeticType>(target: T) -> T? {
    return closestPowerOfTwoWith(coefficient: 2, toTarget: target)
}

/**
 Get power-of-two value (with coefficient) that is closest to a target value.
 
 - parameter coefficient: Coefficient
 - parameter target:      Value to check for closest power-of-two
 
 - returns: Power-of-two value (with coefficient) closest to target value
 */
public func closestPowerOfTwoWith<T: ArithmeticType>(
    coefficient coefficient: T, toTarget target: T
) -> T?
{
    let pseq = Array(PowerSequence(coefficient: coefficient, max: target, doOvershoot: true))
    guard !pseq.isEmpty else { return nil }
    guard pseq.count > 1 else { return pseq.first! }
    let lastPair = pseq.last(amount: 2)!
    return closerTo(target, a: lastPair[0], b: lastPair[1])
}