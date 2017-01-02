//
//  Rational.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/2/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

public protocol Rational:
    Comparable,
    Hashable
{
    // MARK: - Instance Properties
    
    /// Float value.
    var floatValue: Float { get }
    
    /// Inverse of self, if `numerator != 0`. Otherwise, `nil`.
    var inverse: Self? { get }
    
    /// Reduced form of `self`.
    var reduced: Self { get }
    
    /// Numerator.
    var numerator: Int { get }
    
    /// Denominator.
    var denominator: Int { get }
    
    // MARK: - Initializers
    
    /// Create a `Rational` value with a given `numerator` and `denominator`.
    init(_ numerator: Int, _ denominator: Int)
}

extension Rational {
    
    /// Float value.
    public var floatValue: Float {
        return Float(numerator) / Float(denominator)
    }
}

extension Rational {
    
    // MARK: - `Comparable`
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        fatalError()
    }
}

extension Rational {
    
    // MARK: - `Comparable`
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        fatalError("Not yet implemented")
    }
}

extension Rational {
    
    // MARK: - `Hashable`
    
    public var hashValue: Int {
        return numerator.hashValue ^ denominator.hashValue
    }
}


// +(=) / -(=) / *(=) / \/(=)
