//
//  RangeTypeExtensions.swift
//  ArithmeticTools
//
//  Created by Brian Heim on 7/8/17.
//  Copyright © 2017 Brian Heim. All rights reserved.
//

extension Range where Bound: SignedNumber {
    public var length: Bound {
        return upperBound - lowerBound
    }
}

extension CountableRange where Bound: SignedNumber {
    public var length: Bound {
        return upperBound - lowerBound
    }
}

extension CountableClosedRange where Bound: SignedNumber {
    public var length: Bound {
        return upperBound - lowerBound
    }
}

extension ClosedRange where Bound: SignedNumber {
    public var length: Bound {
        return upperBound - lowerBound
    }
}
