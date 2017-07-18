//
//  RangeProtocol.swift
//  ArithmeticTools
//
//  Created by James Bean on 7/18/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Algebra

public protocol RangeProtocol {
    associatedtype Bound: Comparable
    var lowerBound: Bound { get }
    var upperBound: Bound { get }
    init(uncheckedBounds: (lower: Bound, upper: Bound))
}

// FIXME: Use conditional conformances in Swift 4.
// https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md
extension RangeProtocol where Bound: Additive {

    public static var zero: Self {
        return Self(uncheckedBounds: (lower: .zero, upper: .zero))
    }

    public static func + (lhs: Self, rhs: Self) -> Self {
        let lower = min(lhs.lowerBound, rhs.lowerBound)
        let upper = max(lhs.upperBound, rhs.upperBound)
        return Self(uncheckedBounds: (lower: lower, upper: upper))
    }
}

extension Range: RangeProtocol { }
extension CountableRange: RangeProtocol { }
extension ClosedRange: RangeProtocol { }
extension CountableClosedRange: RangeProtocol { }
