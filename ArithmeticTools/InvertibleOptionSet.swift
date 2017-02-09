//
//  InvertibleOptionSet.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/9/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

/// Interface for `OptionSet` types which are symmetrically defined.
///
/// - invariant: The options are defined with `rawValue` values of 
/// `(1 << 0) ... (1 << optionsCount - 1)`.
public protocol InvertibleOptionSet: OptionSet {
    
    /// Inverse of the current option.
    var inverse: Self { get }
    
    /// Amount of options in `self`.
    var optionsCount: Int { get }
}

extension InvertibleOptionSet where RawValue == Int {
    
    /// Inverse of the current option.
    public var inverse: Self {
        let originalValue = countLeadingZeros(rawValue)
        let inverseValue = (optionsCount - 1) - originalValue
        return Self(rawValue: 1 << inverseValue)!
    }
}
