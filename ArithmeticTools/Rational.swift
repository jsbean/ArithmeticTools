//
//  Rational.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/2/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Collections

/// Fraction structure.
public struct Fraction: Rational {
    
    // MARK: - Instance Properties
    
    /// Numerator.
    public let numerator: Int
    
    /// Denominator.
    public let denominator: Int
    
    // MARK: - Initializers
    
    /// Creates a `Fraction` value with a given `numerator` and `denominator`.
    public init(_ numerator: Int, _ denominator: Int) {
        
        guard denominator != 0 else {
            fatalError("Cannot create a Fraction with denominator of 0")
        }
        
        self.numerator = numerator
        self.denominator = denominator
    }
    
    /// Creates a `Fraction` value with the given `rational` value.
    public init <R: Rational> (_ rational: R) {
        self.numerator = rational.numerator
        self.denominator = rational.denominator
    }
}

extension Fraction: ExpressibleByIntegerLiteral {
    
    /// Create a `Fraction` with an intger literal.
    public init(integerLiteral value: Int) {
        self.init(value, 1)
    }
}

/// - returns: Product of any two `Rational`-conforming types as a `Fraction`.
public func * <T: Rational, U: Rational> (lhs: T, rhs: U) -> Fraction {
    return Fraction(lhs.numerator * rhs.numerator, lhs.denominator * rhs.denominator)
}

/// - returns: Quotient of any two `Rational`-conforming types as a `Fraction`.
public func / <T: Rational, U: Rational> (lhs: T, rhs: U) -> Fraction {
    return lhs * rhs.reciprocal
}

/// Model of ratio.
public protocol Rational:
    Monoid,
    SignedNumber,
    Strideable,
    Comparable,
    Hashable,
    CustomStringConvertible
{

    // MARK: - Type Properties
    
    static var unit: Self { get }
    
    // MARK: - Instance Properties
    
    /// Float value.
    var floatValue: Float { get }
    
    /// Double value.
    var doubleValue: Double { get }
    
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
    
    /// - returns: Representation of a `Rational` value with a given `numerator`, if possible.
    /// Otherwise, `nil`.
    ///
    /// > Preserves the arithmetic value of the original `Rational` value.
    func respelling(numerator: Int) -> Self?
    
    /// - returns: Representation of a `Rational` value with a given `denominator`, if
    /// possible. Otherwise, `nil`.
    ///
    /// > Preserves the arithmetic value of the original `Rational` value.
    func respelling(denominator: Int) -> Self?
    
    /// - returns: A new `Rational` value with the given `numerator`, which is no longer
    /// guaranteed to provide the same arithmetic value as before.
    func mutating(numerator: Int) -> Self
    
    /// - returns: A new `Rational` value with the given `denominator`, which is no longer
    /// guaranteed to provide the same arithmetic value as before.
    func mutating(denominator: Int) -> Self
}

extension Rational {
    
    // MARK: - Monoid
    
    /// Monoidal unit.
    public static var unit: Self {
        return Self(0,1)
    }
}

extension Rational {
    
    // MARK: - Signed Number
    
    /// Negate `Rational` type arithmetically.
    public static prefix func -(rational: Self) -> Self {
        return -rational
    }
}

extension Rational {
    
    // MARK: - Strideable
    
    /// - returns: Self advanced by the given `n`.
    public func advanced(by n: Self) -> Self {
        return self + n
    }
    
    /// - returns: Distance to the given `other`.
    public func distance(to other: Self) -> Self {
        return other - self
    }
}

extension Rational {
    
    /// - returns: Representation of a `Rational` value with a given `numerator`, if possible.
    /// Otherwise, `nil`.
    public func respelling(numerator newNumerator: Int) -> Self? {
        
        guard newNumerator != numerator else {
            return self
        }
        
        let quotient = Float(newNumerator) / Float(numerator)
        let newDenominator = Float(denominator) * quotient
        
        guard newDenominator.truncatingRemainder(dividingBy: 1) == 0 else {
            return nil
        }
        
        return Self(newNumerator, Int(newDenominator))
    }
    
    /// - returns: Representation of a `Rational` value with a given `denominator`, if
    /// possible. Otherwise, `nil`.
    public func respelling(denominator newDenominator: Int) -> Self? {
        
        guard newDenominator != denominator else {
            return self
        }
        
        let quotient = Float(newDenominator) / Float(denominator)
        let newNumerator = Float(numerator) * quotient
        
        guard newNumerator.truncatingRemainder(dividingBy: 1) == 0 else {
            return nil
        }

        return Self(Int(newNumerator), newDenominator)
    }
}

extension Rational {
    
    // MARK: - Arithmetic
    
    public var reciprocal: Self {
        return Self(denominator, numerator)
    }
    
    /// - returns: Sum of both `Rational` values.
    public static func + (lhs: Self, rhs: Self) -> Self {
        let (a,b) = normalized(lhs, rhs)
        return Self(a.numerator + b.numerator, a.denominator)
    }
    
    /// Assigns the sum of both `Rational` values to the left-hand-side variable.
    public static func += (lhs: inout Self, rhs: Self) {
        lhs = lhs + rhs
    }
    
    /// - returns: Difference of both `Rational` values.
    public static func - (lhs: Self, rhs: Self) -> Self {
        let (a,b) = normalized(lhs, rhs)
        return Self(a.numerator - b.numerator, a.denominator)
    }
    
    /// Assigns the differnce of both `Rational` values to the left-hand-side variable.
    public static func -= (lhs: inout Self, rhs: Self) {
        lhs = lhs - rhs
    }
    
    /// - returns: Product of both `Rational` values.
    public static func * (lhs: Self, rhs: Self) -> Self {
        return Self(lhs.numerator * rhs.numerator, lhs.denominator * rhs.denominator)
    }
    
    /// Assigns product of both `Rational` values to the left-hand-side variable.
    public static func *= (lhs: inout Self, rhs: Self) {
        lhs = lhs * rhs
    }
    
    /// - returns: Quotient of both `Rational` values.
    public static func / (lhs: Self, rhs: Self) -> Self {
        return lhs * rhs.reciprocal
    }
    
    /// Assigns the quotient of both `Rational` values to the left-hand-side variable.
    public static func /= (lhs: inout Self, rhs: Self) {
        lhs = lhs / rhs
    }
}

extension Rational {
    
    /// - returns: A new `Rational` value with the given `numerator`, which is no longer
    /// guaranteed to provide the same arithmetic value as before.
    public func mutating(numerator newNumerator: Int) -> Self {
        return Self(newNumerator, denominator)
    }
    
    /// - returns: A new `Rational` value with the given `denominator`, which is no longer
    /// guaranteed to provide the same arithmetic value as before.
    public func mutating(denominator newDenominator: Int) -> Self {
        
        guard newDenominator != 0 else {
            fatalError("Cannot create a Rational type with a denominator of 0")
        }
        
        return Self(numerator, newDenominator)
    }
}

extension Rational {
    
    /// - returns: `true` if `self` is equivalent to its most-reduced form.
    public var isReduced: Bool {
        return self == reduced
    }
}

extension Rational {
    
    /// Float value.
    public var floatValue: Float {
        return Float(numerator) / Float(denominator)
    }
    
    /// Double value.
    public var doubleValue: Double {
        return Double(numerator) / Double(denominator)
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
    
    // MARK: - Comparable
    
    /// - returns: `true` if the left `Rational` is less than the right `Rational`. Otherwise, 
    /// `false`.
    public static func < (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = normalized(lhs, rhs)
        return lhs.numerator < rhs.numerator
    }
}

extension Rational {
    
    // MARK: - Equatable
    
    /// - returns: Pair of `Rational` values, each in their most-reduced form.
    public static func reduced <R: Rational> (_ a: R, _ b: R) -> (R, R) {
        return (a.reduced, b.reduced)
    }
    
    /// - returns: Pair of `Rational` values, with common denominators.
    public static func normalized <R: Rational> (_ a: R, _ b: R) -> (R, R) {
        let commonDenominator = lcm(a.denominator, b.denominator)
        return map(a,b) { $0.respelling(denominator: commonDenominator)! }
    }
    
    /// - returns: `true` if both values are equivalent in their most-reduced form.
    public static func == (lhs: Self, rhs: Self) -> Bool {
        let (lhs, rhs) = normalized(lhs, rhs)
        return lhs.numerator == rhs.numerator
    }
}

extension Rational {
    
    // MARK: - Hashable
    
    /// Hash value.
    public var hashValue: Int {
        return floatValue.hashValue
    }
}

extension Rational {
    
    // MARK: - CustomStringConvertible
    
    /// Printed description.
    public var description: String {
        return "\(numerator)/\(denominator)"
    }
}
