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
    
    public var inverse: Self? {
        
        guard numerator != 0 else {
            return nil
        }
        
        return Self(denominator, numerator)
    }
}

extension Rational {
    
    /// Reduced version of `self`.
    public var reduced: Self {
        let common = gcd(abs(numerator), abs(denominator))
        let sign = denominator > 0 ? 1 : -1
        return Self((sign * numerator) / common, (sign * denominator) / common)
    }
}


extension Rational {
    
    // MARK: - `Comparable`
    
    public static func < (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = reduced(lhs, rhs)
        return lhs.numerator < rhs.numerator
    }
}

extension Rational {
    
    // MARK: - `Comparable`

    public static func reduced <R: Rational> (_ a: R, _ b: R) -> (R, R) {
        return (a.reduced, b.reduced)
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = reduced(lhs, rhs)
        return lhs.numerator == rhs.numerator
    }
}

extension Rational {
    
    // MARK: - `Hashable`
    
    public var hashValue: Int {
        return numerator.hashValue ^ denominator.hashValue
    }
}


// +(=) / -(=) / *(=) / \/(=)
