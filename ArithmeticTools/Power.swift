//
//  Power.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public func closestPowerOfTwoTo<T: ArithmeticType>(target: T) -> T? {
    return closestPowerOfTwoWith(coefficient: 2, toTarget: target)
}

public func closestPowerOfTwoWith<T: ArithmeticType>(
    coefficient coefficient: T, toTarget target: T
) -> T?
{
    let powerSequence = PowerSequence(coefficient: coefficient, max: target, doOvershoot: true)
    if let lastPair = Array(powerSequence).last(amount: 2) {
        return closerTo(target, a: lastPair[0], b: lastPair[1])
    }
    return nil
}