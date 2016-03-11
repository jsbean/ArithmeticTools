//
//  Power.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/**
 >`closestPowerOfTwoTo(13) -> 16`
 
 - note: If two values are equidistant from the target value, the lesser value is returned.
 
 >`closestPowerOfTwoTo(12) -> 8 (not 16)`
 
 - returns: Power-of-two value closest to target value
 */
public func closestPowerOfTwo<T: ArithmeticType>(to target: T) -> T? {
    return closestPowerOfTwo(withCoefficient: 2, to: target)
}


/**
 - returns: Power-of-two value closest to and less than target alue
 */
public func closestPowerOfTwo<T: ArithmeticType>(under target: T) -> T? {
    return closestPowerOfTwo(withCoefficient: 2, under: target)
}



/**

 >`closestPowerOfTwoWith(coefficient: 3, toTarget: 22) -> 24`

 - note: If two values are equidistant from the target value, the lesser value is returned.
 
 >`closestPowerOfTwoWith(coefficient: 3, toTarget: 18) -> 12 (not 24)`
 
 - parameter coefficient: Coefficient of exponential expression
 - parameter target:      Value to check for closest power-of-two
 
 - returns: Power-of-two value (with coefficient) closest to target value
 */
public func closestPowerOfTwo<T: ArithmeticType>(withCoefficient coefficient: T,
    to target: T
) -> T?
{
    let pseq = Array(PowerSequence(coefficient: coefficient, max: target, doOvershoot: true))
    guard !pseq.isEmpty else { return nil }
    guard let lastPair = pseq.last(amount: 2) else { return pseq.first! }
    return closer(to: target, a: lastPair[0], b: lastPair[1])
}

/**
 - returns: Power-of-two (with coefficient) closest to and less than target value
 */
public func closestPowerOfTwo<T: ArithmeticType>(withCoefficient coefficient: T,
    under target: T
) -> T?
{
    let pseq = Array(PowerSequence(coefficient: coefficient, max: target, doOvershoot: false))
    guard !pseq.isEmpty else { return nil }
    guard let lastPair = pseq.last(amount: 2) else { return pseq.first! }
    return closer(to: target, a: lastPair[0], b: lastPair[1])
}
