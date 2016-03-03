//
//  Functions.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/**
 Get the greatest common divisor of two values.
 
 - parameter a: One value
 - parameter b: Another value
 
 - returns: Greatest common divisor of two values
 */
public func greatestCommonDivisor<T: ArithmeticType>(a: T, _ b: T) -> T {
    return b == 0 ? a : greatestCommonDivisor(b, T.mod(a,b))
}

/**
 Get the closer of two values to a target value.
 
 - note: If the distances between both values and the target value are equivalent, the first
         value (a) is returned.
 
 - parameter target: Target value to check for closest value
 - parameter a:      One value to check distance from target
 - parameter b:      Another value to check distance from target
 
 - returns: Value closer to target value
 */
public func closerTo<T: ArithmeticType>(target: T, a: T, b: T) -> T {
    return T.abs(a - target) <= T.abs(b - target) ? a : b
}