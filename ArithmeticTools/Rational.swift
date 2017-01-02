//
//  Rational.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/2/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

public protocol Rational:
    ExpressibleByIntegerLiteral,
    ExpressibleByFloatLiteral,
    Comparable,
    Hashable,
    CustomStringConvertible
{
    var numerator: Int { get }
    var denominator: Int { get }
    var floatValue: Float { get }
    var inverse: Self { get }
    var reduced: Self { get }
    
    init(_ numerator: Int, _ denominator: Int)
}

extension Rational {
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        fatalError("Not yet implemented")
    }
}

// +(=) / -(=) / *(=) / \/(=)
