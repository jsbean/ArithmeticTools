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
    return powerSequence.map { $0 }.closestTo(target)
}