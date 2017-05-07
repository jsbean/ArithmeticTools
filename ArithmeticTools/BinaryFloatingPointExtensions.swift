//
//  BinaryFloatingPointExtensions.swift
//  ArithmeticTools
//
//  Created by James Bean on 5/7/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Foundation

extension BinaryFloatingPoint {
    
    /// Scales a `BinaryFloatingPoint` from the given `sourceRange` to the given
    /// `destinationRange`.
    public mutating func scale(
        from sourceRange: ClosedRange<Self>,
        to destinationRange: ClosedRange<Self>
    ) -> Self
    {
        let sourceWidth = sourceRange.upperBound - sourceRange.lowerBound
        let destinationWidth = destinationRange.upperBound - destinationRange.lowerBound
        let position = (self - sourceRange.lowerBound) / sourceWidth
        return position * destinationWidth + destinationRange.lowerBound
    }
    
    /// - returns: A `BinaryFloatingPoint` value scaled from the given `sourceRange` to the
    /// given `destinationRange`.
    public func scaled(
        from sourceRange: ClosedRange<Self>,
        to destinationRange: ClosedRange<Self>
    ) -> Self
    {
        var copy = self
        return copy.scale(from: sourceRange, to: destinationRange)
    }
}
