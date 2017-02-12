//
//  Quadratic.swift
//  ArithmeticTools
//
//  Created by James Bean on 2/12/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import Foundation

/// - returns: A `Set` of 0, 1, or 2 x-intercepts for the given coefficients.
public func quadratic (_ a: Float, _ b: Float, _ c: Float) -> Set<Float> {
    
    let discriminant = pow(b,2) - 4 * a * c
    
    guard discriminant > 0 else {
        return Set()
    }
    
    return Set(
        [1,-1].map { sign in (-b + sign * sqrt(discriminant)) / (2 * a) }
    )
}

/// - returns: A `Set` of 0, 1, or 2 x-intercepts for the given coefficients.
public func quadratic (_ a: Double, _ b: Double, _ c: Double) -> Set<Double> {
    
    let discriminant = pow(b,2) - 4 * a * c
    
    guard discriminant > 0 else {
        return Set()
    }
    
    return Set(
        [1,-1].map { sign in (-b + sign * sqrt(discriminant)) / (2 * a) }
    )
}
