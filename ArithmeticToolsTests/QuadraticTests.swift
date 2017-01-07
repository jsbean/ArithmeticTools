//
//  QuadraticTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 1/7/17.
//  Copyright © 2017 James Bean. All rights reserved.
//

import XCTest
import ArithmeticTools

class QuadraticTests: XCTestCase {

    func testIsEmpty() {
        let result: Set<Float> = quadratic(2,1,3)
        XCTAssert(result.isEmpty)
    }
    
    func testQuadratic() {
        XCTAssertEqual(quadratic(5,6,1), [-1, -0.2])
    }
}
