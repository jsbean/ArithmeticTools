//
//  AbstractAlgebra.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/12/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Foundation
import Collections

/// Interface defining objects with a single property:
///
/// - `Composition` operation.
public protocol Semigroup {
    
    /// - returns: Composition of two of the same `Semigroup` type values.
    static func + (lhs: Self, rhs: Self) -> Self
}

/// Interface defining objects with two methods:
///
/// - `Unit` element
/// - `Composition` operation (inherited from `Semigroup`).
///
public protocol Monoid: Semigroup {
    
    /// - returns: Identity value for this `Monoid` type value.
    static var unit: Self { get }
}

extension Int: Monoid {
    
    public static var unit: Int {
        return 0
    }
}

extension Float: Monoid {
    
    public static var unit: Float {
        return 0
    }
}

extension Double: Monoid {
    
    public static var unit: Double {
        return 0
    }
}

// TODO: Flesh out conformances

extension Array: Monoid {
    
    public static var unit: Array {
        return []
    }
}

extension Set: Monoid {
    
    public static func + <T> (lhs: Set<T>, rhs: Set<T>) -> Set<T> {
        return lhs.union(rhs)
    }
    
    public static var unit: Set {
        return []
    }
}
