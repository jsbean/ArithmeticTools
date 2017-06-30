//
//  Comparison.swift
//  ArithmeticTools
//
//  Created by James Bean on 5/11/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

/// Comparison between two values.
public enum Comparison {

    /// Values are equal.
    case equal

    /// Left value is less than right value.
    case lessThan

    /// Left value is greater than right value.
    case greaterThan
}

/// - Returns: The `Comparison` between the two given values.
public func compare <T: Comparable> (_ a: T, _ b: T) -> Comparison {
    return a < b ? .lessThan : a > b ? .greaterThan : .equal
}

/// - Returns: The greater of the two elements.
public func greaterOf <T: Comparable> (_ a: T, _ b: T) -> T {
    return a > b ? a : b
}

/// - Returns: The lesser of the two elements.
public func lesserOf <T: Comparable> (_ a: T, _ b: T) -> T {
    return a < b ? a : b
}
