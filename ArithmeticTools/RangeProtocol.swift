//
//  RangeProtocol.swift
//  ArithmeticTools
//
//  Created by James Bean on 7/18/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

public protocol RangeProtocol {
    associatedtype Bound: Comparable
    var lowerBound: Bound { get }
    var upperBound: Bound { get }
    init(uncheckedBounds: (lower: Bound, upper: Bound))
}

