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
 
 >`greatestCommonDivisor(12,16) -> 4`
 
 - parameter a: ArithmeticType value
 - parameter b: ArithmeticType value
 
 - returns: Greatest common divisor of a and b
 */
public func greatestCommonDivisor<T: ArithmeticType>(a: T, _ b: T) -> T {
    return b == 0 ? a : greatestCommonDivisor(b, T.mod(a,b))
}


/**
 Get the closer of two values to a target value.
 
 >`closerTo(target: 11, a: 12, b: 3) -> 12`
 
 - note: If the distances between both values and the target value are equivalent, the first
 value (a) is returned.
 
 >`closerTo(target: 6, a: 4, b: 8) -> 4`
 
 - parameter target: Target value to check for closest value
 - parameter a:      ArithmeticType value to check distance from target
 - parameter b:      ArithmeticType value to check distance from target
 
 - returns: Value closer to target value
 */
public func closer<T: ArithmeticType>(to target: T, a: T, b: T) -> T {
    return T.abs(a - target) <= T.abs(b - target) ? a : b
}
