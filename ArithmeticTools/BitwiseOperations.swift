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
///     invert(powerOfTwo: 1 << 3, within: 4) // 1
///
public func invert(powerOfTwo: Int, within max: Int) -> Int {
    let unrolled = log2(powerOfTwo: powerOfTwo)
    return max - unrolled
}

private let intBitCount = MemoryLayout<Int>.size * 8

/// Count Trailing Zeros (ctz) counts the number of zero bits succeeding the least
/// significant one bit. For example, the ctz of 0x00000F00 is 8, and the ctz of
/// 0x80000000 is 31. This also counts the exponent of the `2` factor in the prime
/// factorization of a positive number.
public func countTailingZeros(_ n: Int) -> Int {

	var mask = 1

	for index in 0...intBitCount {
		
        if mask & n > 0 {
			return index
		}
        
		mask <<= 1
	}

	return intBitCount
}

/// Count Leading Zeros (clz) counts the number of zero bits preceding the most
/// significant one bit. For example, the clz of 0x00F00000 is 8, and the clz of
/// 0x00000001 is 31.
public func countLeadingZeros(_ n: Int) -> Int {
    
	var mask = 1 << (intBitCount - 1)

	for index in 0...intBitCount {
		
        if mask & n > 0 {
			return index
		}
        
		mask = mask >>> 1
	}

	return intBitCount
}

infix operator >>> : BitwiseShiftPrecedence

public func >>> (lhs: Int, rhs: Int) -> Int {
    return Int(bitPattern: UInt(bitPattern: lhs) >> UInt(rhs))
}

infix operator >>= : BitwiseShiftPrecedence

public func >>= (lhs: inout Int, rhs: Int) {
    lhs = lhs >>> rhs
}
