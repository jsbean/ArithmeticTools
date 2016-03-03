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
 
 >`closestPowerOfTwoTo(13) -> 16`
 
 - note: If two values are equidistant from the target value, the lesser value is returned.
 
 >`closestPowerOfTwoTo(12) -> 8`
 
 - parameter target: Value to check for closest power-of-two
 
 - returns: Power-of-two value closest to target value
 */
public func closestPowerOfTwoTo<T: ArithmeticType>(target: T) -> T? {
    return closestPowerOfTwoWith(coefficient: 2, toTarget: target)
}

/**
 Get power-of-two value (with coefficient) that is closest to a target value.

 >`closestPowerOfTwoWith(coefficient: 3, toTarget: 22) -> 24`

 - note: If two values are equidistant from the target value, the lesser value is returned.
 
 >`closestPowerOfTwoWith(coefficient: 3, toTarget: 18) -> 12`
 
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