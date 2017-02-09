//
//  BitwiseOperations.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/8/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Foundation

/// Log base 2 of an Integer.
///
/// - warning: This is only accurate if you know this a power-of-two!
public func log2(powerOfTwo x: Int) -> Int {
    return Int(log2(Float(x)))
}

/// Takes an integer that is a power-of-two (e.g., `1 << 3`).
/// This retrieves the right-hand-side value, then inverts this value in relation to the given
/// `max` value. The returned value can then be re-shifted as necessary.
///
/// ```
/// invert(powerOfTwo: 1 << 3, within: 4) // 1
/// ```
public func invert(powerOfTwo: Int, within max: Int) -> Int {
    let unrolled = log2(powerOfTwo: powerOfTwo)
    return max - unrolled
}

