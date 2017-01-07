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
        XCTAssert(quadratic(2,1,3).isEmpty)
    }
    
    func testQuadratic() {
        XCTAssertEqual(quadratic(5,6,1), [-1, -0.2])
    }
}
