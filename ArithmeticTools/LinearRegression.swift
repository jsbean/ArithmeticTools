//
//  LinearRegression.swift
//  ArithmeticTools
//
//  Created by James Bean on 11/8/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import Foundation

public func squared<A: ArithmeticType>(_ values: [A]) -> [A] {
    return values.map { $0 * $0 }
}

public func * <A: ArithmeticType> (lhs: [A], rhs: [A]) -> [A] {
    return zip(lhs,rhs).map(*)
}

func slope <A: ArithmeticType> (_ xs: [A], _ ys: [A]) -> Float {
    let sum1 = (xs * ys).mean! - (xs.mean! * ys.mean!)
    let sum2 = squared(xs).mean! - pow(xs.mean!, 2)
    return sum1 / sum2
}

func linearRegression <A: ArithmeticType> (_ xs: [A], _ ys: [A]) -> (Float) -> (Float) {
    guard !(xs.isEmpty || ys.isEmpty) else { return { _ in 0 } }
    let s = slope(xs,ys)
    let intercept = ys.mean! - (s * xs.mean!)
    return { x in
        intercept + s * x
    }
}

func slope <A: ArithmeticType> (_ dictionary: [A: A]) -> Float {
    return slope(Array(dictionary.keys), Array(dictionary.values))
}

func linearRegression <A: ArithmeticType> (_ dictionary: [A: A]) -> (Float) -> Float {
    return linearRegression(Array(dictionary.keys), Array(dictionary.values))
}
