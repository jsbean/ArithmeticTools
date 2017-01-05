//
//  Rational.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/2/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

/// Model of ratio.
public protocol Rational:
    Comparable,
    Hashable,
    CustomStringConvertible
{
    // MARK: - Instance Properties
    
    /// Float value.
    var floatValue: Float { get }
    
    /// Inverse of self, if `numerator != 0`. Otherwise, `nil`.
    var inverse: Self? { get }
    
    /// Reduced form of `self`.
    var reduced: Self { get }
    
    // Whether or not `self` is in its most-reduced form.
    var isReduced: Bool { get }
    
    /// Numerator.
    var numerator: Int { get }
    
    /// Denominator.
    var denominator: Int { get }
    
    // MARK: - Initializers
    
    /// Create a `Rational` value with a given `numerator` and `denominator`.
    init(_ numerator: Int, _ denominator: Int)
}

extension Rational {
    
    /// - returns: `true` if `self` is equivalent to its most-reduced form.
    public var isReduced: Bool {
        return self == self.reduced
    }
}

extension Rational {
    
    /// Float value.
    public var floatValue: Float {
        return Float(numerator) / Float(denominator)
    }
}

extension Rational {
    
    /// Inverts `denominator` and `numerator` values.
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
    
    /// - returns: `true` if the left `Rational` is less than the right `Rational`. Otherwise, 
    /// `false`.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = reduced(lhs, rhs)
        return lhs.numerator < rhs.numerator
    }
}

extension Rational {
    
    // MARK: - `Equatable`
    
    /// - returns: Pair of `Rational` values, each in their most-reduced form.
    public static func reduced <R: Rational> (_ a: R, _ b: R) -> (R, R) {
        return (a.reduced, b.reduced)
    }
    
    /// - returns: `true` if both values are equivalent in their most-reduced form.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = reduced(lhs, rhs)
        return lhs.numerator == rhs.numerator
    }
}

extension Rational {
    
    // MARK: - `Hashable`
    
    /// Hash value.
    public var hashValue: Int {
        return floatValue.hashValue
    }
}

extension Rational {
    
    // MARK: - `CustomStringConvertible`
    
    /// Printed description.
    public var description: String {
        return "\(numerator)/\(denominator)"
    }
}

// TODO: Arithmetic (+(=) / -(=) / *(=) / \/(=))
