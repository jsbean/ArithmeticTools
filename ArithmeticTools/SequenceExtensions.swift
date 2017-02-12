//
//  SequenceExtensions.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/16/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

extension Sequence where Iterator.Element: Monoid {

    /// Sum of all values in `self`.
    public var sum: Iterator.Element {
        return reduce(.unit, +)
    }
}
