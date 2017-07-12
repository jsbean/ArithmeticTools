//
//  RangeTypeExtensions.swift
//  ArithmeticTools
//
//  Created by Brian Heim on 7/8/17.
//  Copyright © 2017 Brian Heim. All rights reserved.
//

extension Range where Bound: SignedNumber {

    /// - Returns: The length of this range (upperBound - lowerBound).
    public var length: Bound {
        return upperBound - lowerBound
    }

    /// - Returns: A new range equal to this range with bounds shifted by the given amount.
    public func shifted(by amount: Bound) -> Range {
        return (lowerBound + amount)..<(upperBound + amount)
    }
}

extension CountableRange where Bound: SignedNumber {

    /// - Returns: The length of this range (upperBound - lowerBound).
    public var length: Bound {
        return upperBound - lowerBound
    }

    /// - Returns: A new range equal to this range with bounds shifted by the given amount.
    public func shifted(by amount: Bound) -> CountableRange {
        return (lowerBound + amount)..<(upperBound + amount)
    }
}

extension CountableClosedRange where Bound: SignedNumber {

    /// - Returns: The length of this range (upperBound - lowerBound).
    public var length: Bound {
        return upperBound - lowerBound
    }

    /// - Returns: A new range equal to this range with bounds shifted by the given amount.
    public func shifted(by amount: Bound) -> CountableClosedRange {
        return (lowerBound + amount)...(upperBound + amount)
    }
}

extension ClosedRange where Bound: SignedNumber {

    /// - Returns: The length of this range (upperBound - lowerBound).
    public var length: Bound {
        return upperBound - lowerBound
    }

    /// - Returns: A new range equal to this range with bounds shifted by the given amount.
    public func shifted(by amount: Bound) -> ClosedRange {
        return (lowerBound + amount)...(upperBound + amount)
    }
}
