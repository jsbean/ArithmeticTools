//
//  Comparison.swift
//  ArithmeticTools
//
//  Created by James Bean on 5/11/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

/// Comparison between two values.
public enum Comparison {
    
    /// Values are equal.
    case equal
    
    /// Left value is less than right value.
    case lessThan
    
    /// Left value is greater than right value.
    case greaterThan
}

/// - returns: The `Comparison` between the two given values.
public func compare <T: Comparable> (_ a: T, _ b: T) -> Comparison {
    return a < b ? .lessThan : a > b ? .greaterThan : .equal
}
