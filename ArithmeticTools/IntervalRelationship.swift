//
//  IntervalRelationship.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/10/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Foundation

/// Implementation of
/// [Allen's Interval Algebra](https://en.wikipedia.org/wiki/Allen%27s_interval_algebra).
///
/// ## Background
///
/// From [Thomas A. Alspaugh](http://www.ics.uci.edu/~alspaugh/cls/shr/allen.html#Allen1983-mkti):
/// > In 1983 James F. Allen published a paper in which he proposed thirteen basic relations
/// between time intervals that are **distinct**, **exhaustive**, and **qualitative**.
///
/// > - **Distinct** because no pair of definite intervals can be related by
/// more than one of the relationships
/// > - **Exhaustive** because any pair of definite intervals are described by
/// one of the relations
/// > - **Qualitative** (rather than quantitative) because no numeric time spans are considered
///
/// The naming conventions used in this implementation are those of
/// [Allen](https://en.wikipedia.org/wiki/James_F._Allen), refined by
/// [Krokhin et al.](http://www.ics.uci.edu/~alspaugh/cls/shr/allen.html#Allen1983-mkti).
///
/// - TODO: Nest this within `Interval` when nesting inside generic values allowed
/// (Swift 3.1 / 4)
public struct IntervalRelationship: InvertibleOptionSet {
    
    // MARK: - Cases
    
    /// `x` _precedes_ `y`
    ///
    ///     x: |---|
    ///     y:       |---|
    ///
    public static var precedes = IntervalRelationship(rawValue: 1 << 0)
    
    /// `x` _meets_ `y`
    ///
    ///     x: |----|
    ///     y:      |----|
    ///
    public static var meets = IntervalRelationship(rawValue: 1 << 1)
    
    /// `x` _overlaps_ `y`
    ///
    ///     x: |------|
    ///     y:    |------|
    ///
    public static var overlaps = IntervalRelationship(rawValue: 1 << 2)
    
    /// `x` _is finished by_ `y`
    ///
    ///     x: |---------|
    ///     y:      |----|
    ///
    public static var finishedBy = IntervalRelationship(rawValue: 1 << 3)
    
    /// `x` _contains_ `y`
    ///
    ///     x: |----------|
    ///     y:    |----|
    ///
    public static var contains = IntervalRelationship(rawValue: 1 << 4)
    
    /// `x` _starts_ `y`
    ///
    ///     x: |-----|
    ///     y: |----------|
    ///
    public static var starts = IntervalRelationship(rawValue: 1 << 5)
    
    /// `x` _equals_ `y`
    ///
    ///     x: |----------|
    ///     y: |----------|
    ///
    public static var equals = IntervalRelationship(rawValue: 1 << 6)
    
    /// `x` _is started by_ `y`
    ///
    ///     x: |----------|
    ///     y: |-----|
    ///
    public static var startedBy = IntervalRelationship(rawValue: 1 << 7)
    
    /// `x` _is contained by_ `y`
    ///
    ///
    ///     x:    |----|
    ///     y: |----------|
    ///
    public static var containedBy = IntervalRelationship(rawValue: 1 << 8)
    
    /// `x` _finishes_ `y`
    ///
    ///     x:      |-----|
    ///     y: |----------|
    ///
    public static var finishes = IntervalRelationship(rawValue: 1 << 9)
    
    /// `x` _is overlapped by_ `y`
    ///
    ///     x:    |------|
    ///     y: |------|
    ///
    public static var overlappedBy = IntervalRelationship(rawValue: 1 << 10)
    
    /// `x` _is met by_ `y`
    ///
    ///     x:      |----|
    ///     y: |----|
    ///
    public static var metBy = IntervalRelationship(rawValue: 1 << 11)
    
    /// `x` _is preceded by_ `y`
    ///
    ///     x:       |---|
    ///     y: |---|
    ///
    public static var precededBy = IntervalRelationship(rawValue: 1 << 12)
    
    // MARK - Instance Properties
    
    /// Amount of options contained herein.
    public var optionsCount: Int {
        return 13
    }
    
    /// Raw value.
    public let rawValue: Int
    
    // MARK - Initializers
    
    /// Create an IntervalRelationship with `rawValue`.
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension IntervalRelationship: CustomStringConvertible {
    
    // MARK: - CustomStringConvertible
    
    /// Printed description.
    public var description: String {
        switch rawValue {
        case 1 << 0:
            return "precedes"
        case 1 << 1:
            return "meets"
        case 1 << 2:
            return "overlaps"
        case 1 << 3:
            return "finishedBy"
        case 1 << 4:
            return "contains"
        case 1 << 5:
            return "starts"
        case 1 << 6:
            return "equals"
        case 1 << 7:
            return "startedBy"
        case 1 << 8:
            return "during"
        case 1 << 9:
            return "finishes"
        case 1 << 10:
            return "overlappedBy"
        case 1 << 11:
            return "metBy"
        case 1 << 12:
            return "precededBy"
        default:
            return "\(rawValue)"
        }
    }
}
