//
//  PowerTests.swift
//  ArithmeticTools
//
//  Created by James Bean on 3/2/16.
//  Copyright © 2016 James Bean. All rights reserved.
//

import XCTest
@testable import ArithmeticTools

class PowerTests: XCTestCase {

    func testClosestPowerOf2() {
        let closest = closestPowerOfTwoTo(19)!
        XCTAssertEqual(closest, 16)
    }
    
    func testClosestPowerOf2_coeff2() {
        let closest = closestPowerOfTwoWith(coefficient: 2, toTarget: 13)!
        XCTAssertEqual(closest, 16)
    }
    
    func testClosestPowerOf2_coeff3() {
        let closest = closestPowerOfTwoWith(coefficient: 3, toTarget: 11)!
        XCTAssertEqual(closest, 12)
    }
    
    func testClosestPowerOf2_coeff11() {
        let closest = closestPowerOfTwoWith(coefficient: 11, toTarget: 13)!
        XCTAssertEqual(closest, 11)
    }
    
    func testInBetween() {
        let closest = closestPowerOfTwoTo(12)!
        XCTAssertEqual(closest, 8)
    }
}